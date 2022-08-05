// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/update/update_hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/create/hospital_visit_schedule_input_date_field.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/create/hospital_visit_schedule_text_field.dart';

class UpdateHospitalVisitSchedulePage extends StatefulWidget {
  const UpdateHospitalVisitSchedulePage({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<UpdateHospitalVisitSchedulePage> createState() =>
      _UpdateHospitalVisitSchedulePageState();
}

class _UpdateHospitalVisitSchedulePageState
    extends State<UpdateHospitalVisitSchedulePage> {
  late final UpdateHospitalVisitSchedulesCubit
      updateHospitalVisitSchedulesCubit;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    updateHospitalVisitSchedulesCubit = UpdateHospitalVisitSchedulesCubit(
      updateHospitalVisitSchedule:
          KiwiContainer().resolve<UpdateHospitalVisitSchedule>(),
      hospitalVisitSchedule:
          context.read<HospitalVisitSchedulesCubit>().getSchedule(widget.id),
    );

    focusNodes = List.generate(
      3,
      (index) => FocusNode(
        debugLabel: '${Routes.hospitalVisitScheduleUpdate}/${[
          '병원 이름',
          '진료과목',
          '담당의사'
        ][index]}',
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    updateHospitalVisitSchedulesCubit.close();
    focusNodes.forEach((element) => element.dispose());

    super.dispose();
  }

  void openDateTimePicker() => DatePicker.showDateTimePicker(
        context,
        currentTime: DateTime.now(),
        locale: LocaleType.ko,
        onConfirm: (dt) => updateHospitalVisitSchedulesCubit.updateReservedAt(
          dt.millisecondsSinceEpoch,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<UpdateHospitalVisitSchedulesCubit,
                UpdateHospitalVisitSchedulesState>(
              buildWhen: (previous, current) =>
                  previous.reservedAt.value != current.reservedAt.value,
              bloc: updateHospitalVisitSchedulesCubit,
              builder: (context, state) => HospitalScheduleInputDateField(
                label: '예약일시',
                strDateTimeAt: state.reservedAt.value,
                onTap: openDateTimePicker,
              ),
            ),
            HospitalVisitScheduleTextField(
              label: '병원',
              onChanged: updateHospitalVisitSchedulesCubit.updateHospitalName,
              focusNode: focusNodes[0],
              nextFocusNode: focusNodes[1],
            ),
            HospitalVisitScheduleTextField(
              label: '진료과목',
              onChanged: updateHospitalVisitSchedulesCubit.updateMedicalSubject,
              focusNode: focusNodes[1],
              nextFocusNode: focusNodes[2],
            ),
            HospitalVisitScheduleTextField(
              label: '담당의사',
              onChanged: updateHospitalVisitSchedulesCubit.updateDoctorName,
              focusNode: focusNodes[2],
            ),
          ],
        ),
      ),
    );
  }
}
