import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/notification/local_notification_service.dart';

class LocalNotificationProvider extends ChangeNotifier {
  final LocalNotificationService flutterNotificationService;

  LocalNotificationProvider(this.flutterNotificationService);

  bool? _permission = false;
  bool? get permission => _permission;

  bool _isReminderEnabled = false;
  bool get isReminderEnabled => _isReminderEnabled;

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  Future<void> requestPermissions() async {
    _permission = await flutterNotificationService.requestPermissions();
    notifyListeners();
  }

  Future<void> loadReminderState() async {
    _isReminderEnabled = await flutterNotificationService.getReminderState();
    notifyListeners();
  }

  Future<void> setReminder(bool isEnabled) async {
    _isReminderEnabled = isEnabled;
    await flutterNotificationService.setDailyReminder(isEnabled);
    notifyListeners();
  }

}