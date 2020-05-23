import 'package:Telegraph/blocs/provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc extends Disposable {
  final messageAlertStream = BehaviorSubject();
  final messagePreviewStream = BehaviorSubject();
  final messageVibrateStream = BehaviorSubject();
  final messagePopupStream = BehaviorSubject();
  final messageSoundStream = BehaviorSubject();
  final messagePriorityStream = BehaviorSubject();

  final groupAlertStream = BehaviorSubject();
  final groupPreviewStream = BehaviorSubject();
  final groupVibrateStream = BehaviorSubject();
  final groupPopupStream = BehaviorSubject();
  final groupSoundStream = BehaviorSubject();
  final groupPriorityStream = BehaviorSubject();

  final inAppSoundsStream = BehaviorSubject();
  final inAppVibrateStream = BehaviorSubject();
  final inAppPreviewStream = BehaviorSubject();
  final inChatSoundsStream = BehaviorSubject();
  final priorityStream = BehaviorSubject();

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

  Stream<bool> get priority => priorityStream.map((newValue) => newValue);

  Function(bool) get setInAppSounds => inAppSoundsStream.add;
  Function(bool) get setInAppVibrate => inAppVibrateStream.add;
  Function(bool) get setInAppPreview => inAppPreviewStream.add;
  Function(bool) get setInChatSounds => inChatSoundsStream.add;
  Function(bool) get setPriority => priorityStream.add;


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
    priorityStream.close();
  }
}
