import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/create_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/create/create_hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/opacity_check_box.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/create/hospital_visit_schedule_input_date_field.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/create/hospital_visit_schedule_text_field.dart';

class CreateHospitalVisitSchedulePage extends StatefulWidget {
  const CreateHospitalVisitSchedulePage({super.key});

  @override
  State<CreateHospitalVisitSchedulePage> createState() =>
      _CreateHospitalVisitSchedulePageState();
}

class _CreateHospitalVisitSchedulePageState
    extends State<CreateHospitalVisitSchedulePage> {
  late final CreateHospitalVisitSchedulesCubit
      createHospitalVisitSchedulesCubit;

  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    createHospitalVisitSchedulesCubit = CreateHospitalVisitSchedulesCubit(
      KiwiContainer().resolve<CreateHospitalVisitSchedule>(),
    );
    focusNodes = List.generate(
      3,
      (index) => FocusNode(
        debugLabel: '${Routes.hospitalVisitScheduleCreate}/${[
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
    createHospitalVisitSchedulesCubit.close();
    focusNodes.forEach((element) => element.dispose());
    super.dispose();
  }

  void openDateTimePicker() {
    final now = DateTime.now();
    DatePicker.showDateTimePicker(
      context,
      locale: LocaleType.ko,
      currentTime: now,
      minTime: now,
      onConfirm: (dt) => createHospitalVisitSchedulesCubit.updateReservedAt(
        dt.millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar(
          leading: const IconBackButton(),
          title: const Text('외래/검진 등록'),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            children: [
              BlocBuilder<CreateHospitalVisitSchedulesCubit,
                  CreateHospitalVisitSchedulesState>(
                buildWhen: (previous, current) =>
                    previous.reservedAt.value != current.reservedAt.value,
                bloc: createHospitalVisitSchedulesCubit,
                builder: (context, state) => HospitalScheduleInputDateField(
                  label: '예약일시',
                  strDateTimeAt: state.reservedAt.value,
                  onTap: openDateTimePicker,
                ),
              ),
              HospitalVisitScheduleTextField(
                label: '병원',
                onChanged: createHospitalVisitSchedulesCubit.updateHospitalName,
                focusNode: focusNodes[0],
                nextFocusNode: focusNodes[1],
              ),
              HospitalVisitScheduleTextField(
                label: '진료과목',
                onChanged:
                    createHospitalVisitSchedulesCubit.updateMedicalSubject,
                focusNode: focusNodes[1],
                nextFocusNode: focusNodes[2],
              ),
              HospitalVisitScheduleTextField(
                label: '담당의사',
                onChanged: createHospitalVisitSchedulesCubit.updateDoctorName,
                focusNode: focusNodes[2],
              ),
              BlocBuilder<CreateHospitalVisitSchedulesCubit,
                  CreateHospitalVisitSchedulesState>(
                buildWhen: (previous, current) =>
                    previous.push.value != current.push.value,
                bloc: createHospitalVisitSchedulesCubit,
                builder: (context, state) => CupertinoSwitch(
                  value: createHospitalVisitSchedulesCubit.state.push.value,
                  onChanged: createHospitalVisitSchedulesCubit.updatePush,
                ),
              ),
              Row(
                children: [
                  OpacityCheckBox(
                    value: createHospitalVisitSchedulesCubit
                        .state.beforePush.value,
                    onChanged:
                        createHospitalVisitSchedulesCubit.updateBeforePush,
                  ),
                  OpacityCheckBox(
                    value:
                        createHospitalVisitSchedulesCubit.state.afterPush.value,
                    onChanged:
                        createHospitalVisitSchedulesCubit.updateAfterPush,
                  ),
                ],
              ),
              BlocBuilder<CurrentTimeCubit, DateTime>(
                builder: (context, now) => ElevatedButton(
                  onPressed: createHospitalVisitSchedulesCubit
                              .formStatus.index ==
                          1
                      ? () => createHospitalVisitSchedulesCubit.submit().then(
                            (value) {
                              context
                                  .read<HospitalVisitSchedulesCubit>()
                                  .onAddSchedule(value);

                              context.read<SurveyGroupsCubit>().loadSurveyGroup(
                                    hospitalVisitscheduleId: value.id,
                                  );
                              context.popToNamed('/');
                            },
                          )
                      : null,
                  child: const Text('저장'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
