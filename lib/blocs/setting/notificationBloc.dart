import 'package:Telegraph/core/utils/disposable.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc extends Disposable {
  final messageAlertStream = BehaviorSubject<bool>();
  final messagePreviewStream = BehaviorSubject<bool>();
  final messageVibrateStream = BehaviorSubject<String>();
  final messagePopupStream = BehaviorSubject<String>();
  final messageSoundStream = BehaviorSubject<String>();
  final messagePriorityStream = BehaviorSubject<String>();

  final groupAlertStream = BehaviorSubject<bool>();
  final groupPreviewStream = BehaviorSubject<bool>();
  final groupVibrateStream = BehaviorSubject<String>();
  final groupPopupStream = BehaviorSubject<String>();
  final groupSoundStream = BehaviorSubject<String>();
  final groupPriorityStream = BehaviorSubject<String>();

  final inAppSoundsStream = BehaviorSubject();
  final inAppVibrateStream = BehaviorSubject();
  final inAppPreviewStream = BehaviorSubject();
  final inChatSoundsStream = BehaviorSubject();
  final inAppPriorityStream = BehaviorSubject();

  /// Message Notifications
  Stream<bool> get messageAlert =>
      messageAlertStream.map((newValue) => newValue);

  Stream<bool> get messagePreview =>
      messagePreviewStream.map((newValue) => newValue);

  Stream<String> get messageVibrate =>
      messageVibrateStream.map((newValue) => newValue);

  Stream<String> get messagePopup =>
      messagePopupStream.map((newValue) => newValue);

  Stream<String> get messageSound =>
      messageSoundStream.map((newValue) => newValue);

  Stream<String> get messagePriority =>
      messagePriorityStream.map((newValue) => newValue);

  Function(bool) get setMessageAlert => messageAlertStream.add;

  Function(bool) get setMessagePreview => messagePreviewStream.add;

  Function(String) get setMessageVibrate => messageVibrateStream.add;

  Function(String) get setMessagePopup => messagePopupStream.add;

  Function(String) get setMessageSound => messageSoundStream.add;

  Function(String) get setMessagePriority => messagePriorityStream.add;

  /// Group Notifications
  Stream<bool> get groupAlert => groupAlertStream.map((newValue) => newValue);

  Stream<bool> get groupPreview =>
      groupPreviewStream.map((newValue) => newValue);

  Stream<String> get groupVibrate =>
      groupVibrateStream.map((newValue) => newValue);

  Stream<String> get groupPopup => groupPopupStream.map((newValue) => newValue);

  Stream<String> get groupSound => groupSoundStream.map((newValue) => newValue);

  Stream<String> get groupPriority =>
      groupPriorityStream.map((newValue) => newValue);

  Function(bool) get setGroupAlert => groupAlertStream.add;

  Function(bool) get setGroupPreview => groupPreviewStream.add;

  Function(String) get setGroupVibrate => groupVibrateStream.add;

  Function(String) get setGroupPopup => groupPopupStream.add;

  Function(String) get setGroupSound => groupSoundStream.add;

  Function(String) get setGroupPriority => groupPriorityStream.add;

  /// In-app notification

  Stream<bool> get inAppSounds => inAppSoundsStream.map((newValue) => newValue);

  Stream<bool> get inAppVibrate =>
      inAppVibrateStream.map((newValue) => newValue);

  Stream<bool> get inAppPreview =>
      inAppPreviewStream.map((newValue) => newValue);

  Stream<bool> get inChatSounds =>
      inChatSoundsStream.map((newValue) => newValue);

  Stream<bool> get priority => inAppPriorityStream.map((newValue) => newValue);

  Function(bool) get setInAppSounds => inAppSoundsStream.add;
  Function(bool) get setInAppVibrate => inAppVibrateStream.add;
  Function(bool) get setInAppPreview => inAppPreviewStream.add;
  Function(bool) get setInChatSounds => inChatSoundsStream.add;
  Function(bool) get setInAppPriority => inAppPriorityStream.add;


  @override
  void dispose() {
    messageAlertStream.close();
    messagePreviewStream.close();
    messageVibrateStream.close();
    messagePopupStream.close();
    messageSoundStream.close();
    messagePriorityStream.close();

    groupAlertStream.close();
    groupPreviewStream.close();
    groupVibrateStream.close();
    groupPopupStream.close();
    groupSoundStream.close();
    groupPriorityStream.close();

    inAppSoundsStream.close();
    inAppVibrateStream.close();
    inAppPreviewStream.close();
    inChatSoundsStream.close();
    inAppPriorityStream.close();
  }
}
