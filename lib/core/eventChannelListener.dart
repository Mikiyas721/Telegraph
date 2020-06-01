import 'dart:async';

import 'package:Telegraph/core/utils/disposable.dart';
import 'package:flutter/services.dart';

class EventChannelProvider {
  static Map<String, Stream> channels = {};

  static Stream get(String name) {
    if (channels[name] == null) {
      channels[name] = EventChannel('com.jvsofts.ephone.event/$name')
          .receiveBroadcastStream();
    }
    return channels[name];
  }
}

class EventChannelListener implements Disposable {
  final void Function(dynamic) onChange;
  final String name;
  final Stream changeStream;
  StreamSubscription subscription;

  EventChannelListener(this.name, this.onChange)
      : changeStream = EventChannelProvider.get(name) {
    subscription = changeStream.listen(onChange);
  }

  @override
  void dispose() {
    subscription.cancel();
  }
}
