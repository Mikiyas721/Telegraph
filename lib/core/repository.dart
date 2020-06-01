import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import 'dataSource.dart';
import 'json_model.dart';
import 'utils/disposable.dart';

abstract class ItemRepoManager<T extends Mappable> {
  BehaviorSubject<T> register(ItemRepo<T, CRUDSource<T>> repo);

  void unregister(ItemRepo<T, CRUDSource<T>> repo);

  FutureOr<T> onValueAdded(FutureOr<T> future, {options});

  FutureOr<void> onValueRemoved(FutureOr future, {options});
}

abstract class ListRepoManager<T extends JSONModel> {
  BehaviorSubject<List<T>> register(
      ReadOnlyListRepo<T, ReadOnlyListSource<T>> repo);

  bool unregister(ReadOnlyListRepo<T, ReadOnlyListSource<T>> repo);

  FutureOr<List<T>> onValuesAdded(FutureOr<List<T>> future, {options});

  FutureOr<T> onValueAdded(FutureOr<T> future, {options});

  FutureOr onValueRemoved(FutureOr future, String id, {options});

  FutureOr onRemoveAll(FutureOr future, {options});
}

class ItemRepo<T extends Mappable, V extends CRUDSource<T>>
    implements Disposable, CRUDSource<T> {
  final String key;
  final ItemRepoManager<T> manager;
  final V source;

  // ignore: close_sinks
  BehaviorSubject<T> _item;

  BehaviorSubject<T> get item {
    if (_item.isClosed) {
      _item = manager.register(this);
    }
    return _item;
  }

  ItemRepo(this.key)
      : source = GetIt.instance.get<V>(),
        manager = GetIt.instance.get<ItemRepoManager<T>>() {
    _item = manager.register(this);
  }

  FutureOr<T> onValueAdded(FutureOr<T> future) => manager.onValueAdded(
    future,
    options: {'key', key},
  );

  FutureOr onValueRemoved(FutureOr future) => manager.onValueRemoved(
    future,
    options: {'key', key},
  );

  @override
  void dispose() {
    this.manager.unregister(this);
  }

  @override
  FutureOr<T> get({filter}) async {
    final result = await source.get(
      filter: filter,
    );
    return onValueAdded(result);
  }

  @override
  FutureOr<T> create(T tt) async {
    return onValueAdded(source.create(tt));
  }

  @override
  FutureOr<T> update(T tt) async {
    return onValueAdded(source.update(tt));
  }

  @override
  FutureOr<void> delete() async {
    return onValueRemoved(source.delete());
  }
}

class ReadOnlyListRepo<T extends JSONModel, V extends ReadOnlyListSource<T>>
    implements Disposable, ReadOnlyListSource<T> {
  final String key;
  final ListRepoManager<T> manager;
  final V source;

  // ignore: close_sinks
  BehaviorSubject<List<T>> _items;

  BehaviorSubject<List<T>> get items {
    if (_items == null || _items.isClosed) {
      _items = manager.register(this);
    }
    return _items;
  }

  ReadOnlyListRepo(this.key)
      : source = GetIt.instance.get<V>(),
        manager = GetIt.instance.get<ListRepoManager<T>>() {
    _items = manager.register(this);
  }

  FutureOr<List<T>> onValuesAdded(FutureOr<List<T>> future) =>
      manager.onValuesAdded(
        future,
        options: {'key': key},
      );

  FutureOr<T> onValueAdded(FutureOr<T> future) => manager.onValueAdded(
    future,
    options: {'key': key},
  );

  FutureOr onValueRemoved(FutureOr future, String id) => manager.onValueRemoved(
    future,
    id,
  );

  @override
  void dispose() {
    this.manager.unregister(this);
  }

  @override
  FutureOr<List<T>> get({filter, forceRefresh}) async {
    return onValuesAdded(
      source.get(
        filter: filter,
        forceRefresh: forceRefresh,
      ),
    );
  }

  @override
  FutureOr<T> getById(String id, {filter, forceRefresh}) async {
    return onValueAdded(
      source.getById(
        id,
        filter: filter,
        forceRefresh: forceRefresh,
      ),
    );
  }
}

class ListRepo<T extends JSONModel, V extends CRUDListSource<T>>
    extends ReadOnlyListRepo<T, V> implements Disposable, CRUDListSource<T> {
  ListRepo(String key) : super(key);

  @override
  Future<T> create(T tt) async {
    return onValueAdded(source.create(tt));
  }

  @override
  Future<T> update(T tt) async {
    return onValueAdded(source.update(tt));
  }

  @override
  Future<void> delete(String id) async {
    return onValueRemoved(source.delete(id), id);
  }

  @override
  FutureOr<void> deleteAll() {
    manager.onRemoveAll(source.deleteAll());
  }

  @override
  Future<int> count({where, bool forceRefresh}) {
    return source.count(where: where, forceRefresh: forceRefresh);
  }
}

class SingleItemRepoManager<T extends Mappable> extends ItemRepoManager<T> {
  BehaviorSubject<T> _stream;

  @override
  BehaviorSubject<T> register(ItemRepo<T, CRUDSource<T>> repo) {
    if (_stream == null || _stream.isClosed) {
      _stream = BehaviorSubject.seeded(null);
    }
    repo._item = _stream;
    return _stream;
  }

  @override
  void unregister(ItemRepo<T, CRUDSource<T>> repo) {
    if (_stream != null && !_stream.hasListener) {
      _stream.close();
      _stream = null;
    }
    repo._item = null;
  }

  @override
  FutureOr<T> onValueAdded(FutureOr<T> future, {options}) {
    _stream.add(future);
    return future;
  }

  @override
  FutureOr onValueRemoved(FutureOr future, {options}) {
    _stream.add(null);
    return future;
  }
}

class SingleListRepoManager<T extends JSONModel> extends ListRepoManager<T> {
  BehaviorSubject<List<T>> _stream;

  @override
  BehaviorSubject<List<T>> register(
      ReadOnlyListRepo<T, ReadOnlyListSource<T>> repo) {
    if (_stream == null) {
      _stream = BehaviorSubject.seeded([]);
    }
    return _stream;
  }

  @override
  bool unregister(ReadOnlyListRepo<T, ReadOnlyListSource<T>> repo) {
    _stream?.close();
    return true;
  }

  @override
  FutureOr<T> onValueAdded(FutureOr<T> future, {options}) async {
    final result = await future;
    if (result == null) return result;
    final list = _stream.value;
    final index = list.indexOf(result);
    if (index >= 0)
      list[index] = result;
    else
      list.add(result);
    _stream.add(list);
    return result;
  }

  @override
  FutureOr<List<T>> onValuesAdded(FutureOr<List<T>> future, {options}) async {
    final result = await future;
    if (result == null) return result;
    final list = _stream.value;

    result.forEach((t) {
      final index = list.indexOf(t);
      if (index >= 0)
        list[index] = t;
      else
        list.add(t);
    });
    _stream.add(list);
    return result;
  }

  @override
  FutureOr onValueRemoved(FutureOr future, String id, {options}) {
    final list = _stream.value;
    _stream.add(list..removeWhere((v) => v.id == id));
    return future;
  }

  @override
  FutureOr onRemoveAll(FutureOr future, {options}) async {
    await future;
    _stream.add([]);
    return future;
  }
}

class MultiListRepoManager<T extends JSONModel> extends ListRepoManager<T> {
  final Map<String, BehaviorSubject<List<T>>> _repos = {};

  @override
  BehaviorSubject<List<T>> register(
      ReadOnlyListRepo<T, ReadOnlyListSource<T>> repo) {
    _repos[repo.key] = _repos[repo.key] ?? BehaviorSubject.seeded([]);
    return _repos[repo.key];
  }

  @override
  bool unregister(ReadOnlyListRepo<T, ReadOnlyListSource<T>> repo) {
    final stream = _repos[repo.key];
    if (!stream.hasListener) {
      stream.close();
      _repos.remove(repo.key);
      return true;
    }
    return false;
  }

  @override
  FutureOr<List<T>> onValuesAdded(FutureOr<List<T>> future, {options}) async {
    final res = await future;
    if (res == null) return res;
    _repos.forEach((k, items) {
      final list = items.value;
      res.forEach((t) {
        final index = list.indexOf(t);
        if (options['key'] == k) {
          if (index >= 0)
            list[index] = t;
          else
            list.add(t);
        } else if (index >= 0) list[index] = t;
      });
      items.add(list);
    });
    return res;
  }

  FutureOr<T> onValueAdded(FutureOr<T> future, {options}) async {
    final result = await future;
    if (result == null) return result;
    _repos.forEach((k, items) {
      final list = items.value;
      final index = list.indexOf(result);
      if (options['key'] == k) {
        if (index >= 0)
          list[index] = result;
        else
          list.add(result);
      } else if (index >= 0) list[index] = result;
      items.add(list);
    });
    return result;
  }

  @override
  FutureOr onValueRemoved(FutureOr future, String id, {options}) async {
    _repos.forEach((k, items) {
      final list = items.value;
      items.add(list..removeWhere((v) => v.id == id));
    });
    return future;
  }

  @override
  FutureOr onRemoveAll(FutureOr future, {options}) async {
    await future;
    _repos.forEach((k, items) {
      items.add([]);
    });
    return future;
  }
}
