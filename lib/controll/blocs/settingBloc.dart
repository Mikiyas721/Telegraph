import 'dart:async';

import 'package:Telegraph/controll/blocs/provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SettingBloc implements Disposable {
  final enableAnimationStream = BehaviorSubject();
  final inAppBrowserStream = BehaviorSubject();
  final directShareStream = BehaviorSubject();
  final messageTextSizeStream = BehaviorSubject();
  final raiseToSpeakStream = BehaviorSubject();
  final sendByEnterStream = BehaviorSubject();
  final autoPlayGifStream = BehaviorSubject();
  final saveToGalleryStream = BehaviorSubject();

   Stream<bool> get enableAnimation {
    return enableAnimationStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setAnimationEnabled => enableAnimationStream.add;

  Stream<bool> get inAppBrowser {
    return inAppBrowserStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setInAppBrowser => inAppBrowserStream.add;

  Stream<bool> get directShare {
    return directShareStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setDirectShare => directShareStream.add;

  Stream<int> get messageTextSize {
    return messageTextSizeStream.map((size) => size);
  }

  Function(int size) get setMessageTextSize => messageTextSizeStream.add;

  Stream<bool> get raiseToSpeak {
    return raiseToSpeakStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setRaiseToSpeak => raiseToSpeakStream.add;

  Stream<bool> get sendByEnter {
    return sendByEnterStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setSendByEnter => sendByEnterStream.add;

  Stream<bool> get autoPlayGif {
    return autoPlayGifStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setAutoPlayGif => autoPlayGifStream.add;

  Stream<bool> get saveToGallery {
    return saveToGalleryStream.map((newValue) => newValue);
  }

  Function(bool newValue) get setSaveToGallery => saveToGalleryStream.add;

  dispose() {
    enableAnimationStream.close();
    inAppBrowserStream.close();
    directShareStream.close();
    messageTextSizeStream.close();
    raiseToSpeakStream.close();
    sendByEnterStream.close();
    autoPlayGifStream.close();
    saveToGalleryStream.close();
  }
}
