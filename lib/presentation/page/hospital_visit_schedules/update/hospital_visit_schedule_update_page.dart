// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/table/hospital_visit_schedule/hospital_visit_schedule_table.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/hospital_visit_schedule/hospital_visit_schedule.dart';
import 'package:yak/domain/usecases/hospital_visit_schedule/update_hospital_visit_schedule.dart';
import 'package:yak/presentation/bloc/current_time/current_time_cubit.dart';
import 'package:yak/presentation/bloc/hospital_visit_schedules/cubit/hospital_visit_schedule_update_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_date_field.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/opacity_check_button.dart';
import 'package:yak/presentation/widget/hospital_visit_schedule/create/hospital_visit_schedule_text_field.dart';

class HospitalVisitScheduleUpdatePage extends StatefulWidget {
  const HospitalVisitScheduleUpdatePage({
    super.key,
    required this.hospitalVisitSchedule,
  });
  final HospitalVisitSchedule hospitalVisitSchedule;
  @override
  State<HospitalVisitScheduleUpdatePage> createState() =>
      _HospitalVisitScheduleUpdatePageState();
}

class _HospitalVisitScheduleUpdatePageState
    extends State<HospitalVisitScheduleUpdatePage> {
  late final HospitalVisitScheduleUpdateCubit hospitalVisitScheduleUpdateCubit;

  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    hospitalVisitScheduleUpdateCubit = HospitalVisitScheduleUpdateCubit(
      hospitalVisitSchedule: widget.hospitalVisitSchedule,
      updateHospitalVisitSchedule:
          KiwiContainer().resolve<UpdateHospitalVisitSchedule>(),
    );
    focusNodes = List.generate(
      4,
      (index) => FocusNode(
        debugLabel: '${Routes.hospitalVisitScheduleCreate}/${[
          '병원',
          '예약일시',
          '진료과목',
          '담당의사'
        ][index]}',
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    hospitalVisitScheduleUpdateCubit.close();

    for (final element in focusNodes) {
      element.dispose();
    }
    super.dispose();
  }

  void openDateTimePicker() {
    final reservedAt = hospitalVisitScheduleUpdateCubit.state.reservedAt.value;

    final now = DateTime.now();

    DatePicker.showDateTimePicker(
      context,
      locale: LocaleType.ko,
      currentTime:
          reservedAt == null || reservedAt.isBefore(now) ? now : reservedAt,
      minTime: now,
      onConfirm: hospitalVisitScheduleUpdateCubit.updateReservedAt,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/icon_info.svg'),
                      const SizedBox(width: 5),
                      Text(
                        '이용안내',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ).rixMGoB,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '검진/외래 일정을 직접 등록하는 화면입니다.\n병원에서 안내한 일정을 확인 후 정확히 입력해주세요.',
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
                '예약구분',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.gray,
                ).rixMGoB,
              ),
              const SizedBox(height: 12),
              IgnorePointer(
                child: BlocBuilder<HospitalVisitScheduleUpdateCubit,
                    HospitalVisitScheduleUpdateState>(
                  bloc: hospitalVisitScheduleUpdateCubit,
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
                            : hospitalVisitScheduleUpdateCubit
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
                              '정기검진',
                              style: const TextStyle(
                                color: Colors.black,
                              ).rixMGoB,
                            ),
                          ),
                          DropdownMenuItem<HospitalVisitScheduleType>(
                            value: HospitalVisitScheduleType.outpatient,
                            child: Text(
                              '외래진료',
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
              ),
              const SizedBox(height: 16),
              BlocBuilder<HospitalVisitScheduleUpdateCubit,
                  HospitalVisitScheduleUpdateState>(
                bloc: hospitalVisitScheduleUpdateCubit,
                builder: (context, state) => HospitalVisitScheduleTextField(
                  label: '병원',
                  onChanged:
                      hospitalVisitScheduleUpdateCubit.updateHospitalName,
                  focusNode: focusNodes[0],
                  onFieldSubmitted: (str) => openDateTimePicker(),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<HospitalVisitScheduleUpdateCubit,
                  HospitalVisitScheduleUpdateState>(
                buildWhen: (previous, current) =>
                    previous.reservedAt.value != current.reservedAt.value,
                bloc: hospitalVisitScheduleUpdateCubit,
                builder: (context, state) => CommonInputDateField(
                  label: '예약일시',
                  dateTime: state.reservedAt.value,
                  onTap: openDateTimePicker,
                ),
              ),
              const SizedBox(height: 16),
              HospitalVisitScheduleTextField(
                label: '진료과목',
                onChanged:
                    hospitalVisitScheduleUpdateCubit.updateMedicalSubject,
                focusNode: focusNodes[2],
                nextFocusNode: focusNodes[3],
              ),
              const SizedBox(height: 16),
              HospitalVisitScheduleTextField(
                label: '담당의사',
                onChanged: hospitalVisitScheduleUpdateCubit.updateDoctorName,
                focusNode: focusNodes[3],
              ),
              const SizedBox(height: 24),
              BlocBuilder<HospitalVisitScheduleUpdateCubit,
                  HospitalVisitScheduleUpdateState>(
                bloc: hospitalVisitScheduleUpdateCubit,
                builder: (context, state) => CommonShadowBox(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            '알림설정',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                            ).rixMGoB,
                          ),
                          const Spacer(),
                          Text(
                            '알림사용',
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
                                hospitalVisitScheduleUpdateCubit.updatePush,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          OpacityCheckButton(
                            opacity: state.beforePush.value ? 1 : 0,
                            onTap: () => hospitalVisitScheduleUpdateCubit
                                .updateBeforePush(!state.beforePush.value),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '1일 전 알림',
                            style: const TextStyle(fontSize: 15).rixMGoB,
                          ),
                          const Spacer(),
                          OpacityCheckButton(
                            opacity: state.afterPush.value ? 1 : 0,
                            onTap: () => hospitalVisitScheduleUpdateCubit
                                .updateAfterPush(!state.afterPush.value),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '2시간 전 알림',
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
                  onPressed: hospitalVisitScheduleUpdateCubit
                              .formStatus.index ==
                          1
                      ? () => hospitalVisitScheduleUpdateCubit.submit().then(
                            (hospitalVisitSchedule) {
                              if (hospitalVisitSchedule == null) return;
                              Fluttertoast.showToast(
                                msg: '포인트가 리셋되었습니다',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.black.withOpacity(0.8),
                                textColor: Colors.white,
                                fontSize: 16,
                              );
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
                  child: const Text('예약일정 저장'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}