// Package imports:
import 'package:kiwi/kiwi.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:yak/core/object_box/objectbox.g.dart';
import 'package:yak/data/models/medication_information/medication_information_model.dart';
import 'package:yak/data/models/medication_schedule/medication_schedule_model.dart';
import 'package:yak/data/models/notification/schedule_notificaiton_model.dart';
import 'package:yak/data/models/prescription/prescription_model.dart';
import 'package:yak/data/models/user/last_login_user_model.dart';

class ObjectBox {
  late final Store store;

  /// Create an instance of ObjectBox to use throughout the app.
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    store = Store(getObjectBoxModel(), directory: '${dir.path}/objectbox');

    // Box<MedicationScheduleModel>(store).removeAll();
    // Box<MedicationInformationModel>(store).removeAll();
    // Box<PrescriptionModel>(store).removeAll();
    // Box<ScheduleNotificationModel>(store).removeAll();
    // AwesomeNotifications().cancelAll();
  }
}

mixin ObjectBoxMixin {
  Store get store => KiwiContainer().resolve<ObjectBox>().store;

  late final Box<MedicationScheduleModel> medicationScheduleBox =
      Box<MedicationScheduleModel>(store);
  late final Box<MedicationInformationModel> medicationInformationBox =
      Box<MedicationInformationModel>(store);

  late final Box<PrescriptionModel> prescriptionBox =
      Box<PrescriptionModel>(store);

  late final Box<LastLoginUserModel> lastLoginUserBox =
      Box<LastLoginUserModel>(store);

  late final Box<ScheduleNotificationModel> scheduleNotificationBox =
      Box<ScheduleNotificationModel>(store);
}
