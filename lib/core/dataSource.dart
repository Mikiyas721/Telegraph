import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'json_model.dart';
import 'restClient.dart';

abstract class APIDataSource {
  final RestClient client;

  APIDataSource(this.client);

  Dio get dio => client.dio;
}

abstract class CacheSource {
  final SharedPreferences preference;

  const CacheSource(this.preference);

  Future<bool> setObject(String key, Map<String, dynamic> map) async =>
      await (preference).setString(key, jsonEncode(map));

  Map<String, dynamic> getObject(String key) {
    final json = (preference).getString(key);
    return json == null ? null : jsonDecode(json);
  }

  setList(String key, List<Map<String, dynamic>> list) =>
      (preference).setString(key, jsonEncode(list));

  List<Map<String, dynamic>> getList(String key) {
    final x = (preference).getString(key);
    return x == null
        ? null
        : (jsonDecode(x) as List)
            .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
            .toList();
  }
}

abstract class CRUDSource<T extends Mappable> {
  FutureOr<T> get({filter});

  FutureOr<T> create(T t);

  FutureOr<T> update(T t);

  FutureOr<void> delete();
}

abstract class ReadOnlyListSource<T extends JSONModel> {
  FutureOr<List<T>> get({filter, bool forceRefresh});

  FutureOr<T> getById(String id, {filter, bool forceRefresh});
}

abstract class CRUDListSource<T extends JSONModel>
    implements ReadOnlyListSource<T> {
  FutureOr<T> create(T t);

  FutureOr<T> update(T t);

  FutureOr<void> delete(String id);

  FutureOr<void> deleteAll();

  Future<int> count({where, bool forceRefresh});
}

class CacheCRUDSource<T extends Mappable> extends CacheSource
    implements CRUDSource<T> {
  final String name;
  final T Function(Map<String, dynamic>) factory;

  const CacheCRUDSource(SharedPreferences preference, this.name, this.factory)
      : super(preference);

  @override
  FutureOr<T> create(T t) {
    setObject(name, t.toMap());
    return t;
  }

  @override
  FutureOr<void> delete() {
    preference.remove(name);
  }

  @override
  FutureOr<T> get({filter}) {
    return factory(getObject(name));
  }

  @override
  FutureOr<T> update(T t) {
    return create(t);
  }
}

class CacheCRUDListSource<T extends JSONModel> extends CacheSource
    implements CRUDListSource<T> {
  final String name;
  final Function factory;

  CacheCRUDListSource(SharedPreferences preference, this.name, this.factory)
      : super(preference);

  @override
  Future<T> create(T t) async {
    final items = (await get()) ?? [];

    final Set<T> s = items.toSet();
    s.remove(t);
    s.add(t);
    setList(
      name,
      s.map((v) => v.toMap()).toList(),
    );
    return t;
  }

  @override
  Future<void> delete(String id) async {
    final items = await get();
    items.removeWhere((item) => item.id == id);
    setList(name, items.map((v) => v.toMap()).toList());
  }

  @override
  Future<List<T>> get({filter, bool forceRefresh}) async {
    final res = getList(name);
    return res?.map<T>((item) => factory(item))?.toList();
  }

  @override
  Future<T> getById(String id, {filter, bool forceRefresh}) async {
    final items = await get();
    return items.firstWhere((i) => i.id == id);
  }

  @override
  Future<T> update(T t) {
    return create(t);
  }

  @override
  FutureOr<void> deleteAll() {
    preference.remove(name);
  }

  @override
  Future<int> count({where, bool forceRefresh}) {
    // TODO: implement count
    throw UnimplementedError();
  }
}

class RemoteCRUDSource<T extends JSONModel> extends APIDataSource
    implements CRUDListSource<T> {
  final String path;
  final T Function(Map<String, dynamic>) factory;
  final Duration maxAge;
  final Duration maxStale;

  RemoteCRUDSource(
    RestClient client,
    this.path,
    this.factory, {
    this.maxAge = Duration.zero,
    this.maxStale = const Duration(days: 2),
  }) : super(client);

  Options getCacheOptions([bool refresh = false]) {
    return buildCacheOptions(
      maxAge,
      maxStale: maxStale,
      forceRefresh: refresh,
    );
  }

  Future<T> getById(String id, {filter, bool forceRefresh = false}) {
    return client.request<T>(
      dio.get(
        '/$path/$id',
        queryParameters: filter == null ? null : {'filter': jsonEncode(filter)},
        options: getCacheOptions(forceRefresh),
      ),
      (map) => factory(map as Map<String, dynamic>),
    );
  }

  Future<List<T>> get({filter, bool forceRefresh = false}) {
    return client.request<List<T>>(
      dio.get(
        '/$path',
        queryParameters: filter == null ? null : {'filter': jsonEncode(filter)},
        options: getCacheOptions(forceRefresh),
      ),
      (res) => res.map<T>((d) => factory(d as Map<String, dynamic>)).toList(),
    );
  }

  Future<T> create(T t) {
    return client.request<T>(dio.post('/$path', data: t.toMap()),
        (map) => factory(map as Map<String, dynamic>));
  }

  Future<T> update(T t) {
    return client.request<T>(
      dio.patch('/$path', data: t.toMap()),
      (map) => factory(map as Map<String, dynamic>),
    );
  }

  Future<void> delete(String id) {
    return client.request(dio.delete('/$path/$id'));
  }

  @override
  FutureOr<void> deleteAll() {
    throw UnimplementedError();
  }

  Future<int> count({where, bool forceRefresh = false}) {
    return client.request<int>(
      dio.get(
        '/$path/count',
        queryParameters: where == null ? null : {'where': jsonEncode(where)},
        options: getCacheOptions(forceRefresh),
      ),
      (res) => res['count'] as int,
    );
  }
}

class PlatformDataSource {
  final MethodChannel channel;

  PlatformDataSource(this.channel);

  call(
    String methodName, [
    Map<String, dynamic> arguments,
  ]) {
    channel.invokeMethod(methodName, arguments);
  }

  Future<Map<String, dynamic>> callMap(
    String methodName, [
    Map<String, dynamic> arguments,
  ]) {
    return channel.invokeMapMethod(methodName, arguments);
  }

  Future<List<dynamic>> callList(
    String methodName, [
    Map<String, dynamic> arguments,
  ]) {
    return channel.invokeListMethod(methodName, arguments);
  }
}

class PlatformReadOnlySource<T extends JSONModel> extends PlatformDataSource
    implements ReadOnlyListSource<T> {
  final String name;
  final T Function(Map<String, dynamic>) factory;

  PlatformReadOnlySource(MethodChannel channel, this.name, this.factory)
      : super(channel);

  @override
  Future<List<T>> get({filter, bool forceRefresh}) async {
    final result =
        await callList('get', {if (filter != null) 'filter': filter});

    final res =
        result.map((map) => factory(map.cast<String, dynamic>())).toList();
    return res;
  }

  @override
  Future<T> getById(String id, {filter, bool forceRefresh}) async {
    final result = await callMap(
      'getById',
      {'id': id, if (filter != null) 'filter': filter},
    );
    return factory(result);
  }
}

class PlatformCRUDSource<T extends JSONModel> extends PlatformReadOnlySource<T>
    implements CRUDListSource<T> {
  PlatformCRUDSource(
    MethodChannel channel,
    String name,
    T Function(Map<String, dynamic>) factory,
  ) : super(channel, name, factory);

  @override
  Future<T> create(T t) async {
    final result = await callMap('create', {'data': t.toMap()});
    return factory(result);
  }

  @override
  Future<void> delete(String id) {
    return call('delete', {'id': id});
  }

  @override
  Future<T> update(T t) async {
    final result = await callMap('update', {'data': t.toMap()});
    return factory(result);
  }

  @override
  FutureOr<void> deleteAll() {
    throw UnimplementedError();
  }

  @override
  Future<int> count({where, bool forceRefresh}) {
    // TODO: implement count
    throw UnimplementedError();
  }
}
