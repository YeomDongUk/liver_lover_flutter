// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/create_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/create/create_hospital_visit_schedules_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_date_field.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/opacity_check_button.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/create/hospital_visit_schedule_text_field.dart';

class HospitalVisitScheduleCreatePage extends StatefulWidget {
  const HospitalVisitScheduleCreatePage({super.key});

  @override
  State<HospitalVisitScheduleCreatePage> createState() =>
      _HospitalVisitScheduleCreatePageState();
}

class _HospitalVisitScheduleCreatePageState
    extends State<HospitalVisitScheduleCreatePage> {
  late final CreateHospitalVisitSchedulesCubit
      createHospitalVisitSchedulesCubit;

  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    createHospitalVisitSchedulesCubit = CreateHospitalVisitSchedulesCubit(
      KiwiContainer().resolve<CreateHospitalVisitSchedule>(),
    );
    focusNodes = List.generate(
      4,
      (index) => FocusNode(
        debugLabel: '${Routes.hospitalVisitScheduleCreate}/${[
          '??????',
          '????????????',
          '????????????',
          '????????????'
        ][index]}',
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    createHospitalVisitSchedulesCubit.close();

    for (final element in focusNodes) {
      element.dispose();
    }
    super.dispose();
  }

  void openDateTimePicker() {
    final reservedAt = createHospitalVisitSchedulesCubit.state.reservedAt.value;

    final now = DateTime.now();

    DatePicker.showDateTimePicker(
      context,
      locale: LocaleType.ko,
      currentTime:
          reservedAt == null || reservedAt.isBefore(now) ? now : reservedAt,
      minTime: now,
      onConfirm: createHospitalVisitSchedulesCubit.updateReservedAt,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar(
          leading: const IconBackButton(),
          title: const Text('??????/?????? ??????'),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/icon_info.svg'),
                      const SizedBox(width: 5),
                      Text(
                        '????????????',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ).rixMGoB,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '??????/?????? ????????? ?????? ???????????? ???????????????.\n???????????? ????????? ????????? ?????? ??? ????????? ??????????????????.',
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.3,
                      color: AppColors.gray,
                    ).rixMGoB,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                color: AppColors.blueGrayLight,
              ),
              const SizedBox(height: 24),
              Text(
                '????????????',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                ).rixMGoB,
              ),
              const SizedBox(height: 12),
              BlocBuilder<CreateHospitalVisitSchedulesCubit,
                  CreateHospitalVisitSchedulesState>(
                bloc: createHospitalVisitSchedulesCubit,
                buildWhen: (previous, current) =>
                    previous.hospitalVisitType.value !=
                    current.hospitalVisitType.value,
                builder: (context, state) => SizedBox(
                  height: 48,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<HospitalVisitScheduleType>(
                      value: state.hospitalVisitType.value,
                      onChanged: (value) => value == null
                          ? null
                          : createHospitalVisitSchedulesCubit
                              .udpateHospitalVisitScheduleType(value),
                      icon: SvgPicture.asset('assets/svg/down.svg'),
                      buttonPadding: const EdgeInsets.only(
                        left: 10,
                        right: 12,
                      ),
                      buttonElevation: 0,
                      dropdownElevation: 0,
                      buttonDecoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGray,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      dropdownDecoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGray,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      items: [
                        DropdownMenuItem<HospitalVisitScheduleType>(
                          value: HospitalVisitScheduleType.regular,
                          child: Text(
                            '????????????',
                            style: const TextStyle(
                              color: Colors.black,
                            ).rixMGoB,
                          ),
                        ),
                        DropdownMenuItem<HospitalVisitScheduleType>(
                          value: HospitalVisitScheduleType.outpatient,
                          child: Text(
                            '????????????',
                            style: const TextStyle(
                              color: Colors.black,
                            ).rixMGoB,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CreateHospitalVisitSchedulesCubit,
                  CreateHospitalVisitSchedulesState>(
                bloc: createHospitalVisitSchedulesCubit,
                builder: (context, state) => HospitalVisitScheduleTextField(
                  label: '??????',
                  onChanged:
                      createHospitalVisitSchedulesCubit.updateHospitalName,
                  focusNode: focusNodes[0],
                  onFieldSubmitted: (str) => openDateTimePicker(),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CreateHospitalVisitSchedulesCubit,
                  CreateHospitalVisitSchedulesState>(
                buildWhen: (previous, current) =>
                    previous.reservedAt.value != current.reservedAt.value,
                bloc: createHospitalVisitSchedulesCubit,
                builder: (context, state) => CommonInputDateField(
                  label: '????????????',
                  dateTime: state.reservedAt.value,
                  onTap: openDateTimePicker,
                ),
              ),
              const SizedBox(height: 16),
              HospitalVisitScheduleTextField(
                label: '????????????',
                onChanged:
                    createHospitalVisitSchedulesCubit.updateMedicalSubject,
                focusNode: focusNodes[2],
                nextFocusNode: focusNodes[3],
              ),
              const SizedBox(height: 16),
              HospitalVisitScheduleTextField(
                label: '????????????',
                onChanged: createHospitalVisitSchedulesCubit.updateDoctorName,
                focusNode: focusNodes[3],
              ),
              const SizedBox(height: 24),
              BlocBuilder<CreateHospitalVisitSchedulesCubit,
                  CreateHospitalVisitSchedulesState>(
                bloc: createHospitalVisitSchedulesCubit,
                builder: (context, state) => CommonShadowBox(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            '????????????',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                            ).rixMGoB,
                          ),
                          const Spacer(),
                          Text(
                            '????????????',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.gray,
                            ).rixMGoB,
                          ),
                          const SizedBox(width: 9),
                          CommonSwitch(
                            value:
                                state.beforePush.value || state.afterPush.value,
                            onToggle:
                                createHospitalVisitSchedulesCubit.updatePush,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          OpacityCheckButton(
                            opacity: state.beforePush.value ? 1 : 0,
                            onTap: () => createHospitalVisitSchedulesCubit
                                .updateBeforePush(!state.beforePush.value),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '1??? ??? ??????',
                            style: const TextStyle(fontSize: 15).rixMGoB,
                          ),
                          const Spacer(),
                          OpacityCheckButton(
                            opacity: state.afterPush.value ? 1 : 0,
                            onTap: () => createHospitalVisitSchedulesCubit
                                .updateAfterPush(!state.afterPush.value),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '2?????? ??? ??????',
                            style: const TextStyle(fontSize: 15).rixMGoB,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<CurrentTimeCubit, DateTime>(
                builder: (context, now) => ElevatedButton(
                  onPressed:
                      createHospitalVisitSchedulesCubit.formStatus.index == 1
                          ? () =>
                              createHospitalVisitSchedulesCubit.submit().then(
                                (hospitalVisitSchedule) {
                                  if (hospitalVisitSchedule == null) return;
                                  context.popToNamed('/');
                                },
                              )
                          : null,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    textStyle: const TextStyle(fontSize: 17).rixMGoEB,
                  ),
                  child: const Text('???????????? ??????'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
