// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/class/optional.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/functions.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/data/datasources/local/pill/pill_local_data_source.dart';
import 'package:yak/data/models/medication_information/medication_information_create_form.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/usecases/prescription/create_prescriotion.dart';
import 'package:yak/presentation/bloc/prescription/create/prescription_create_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_date_field.dart';
import 'package:yak/presentation/widget/common/common_input_form_field.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/common_switch.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/opacity_check_button.dart';
import 'package:yak/presentation/widget/common/page_index_indicator.dart';
import 'package:yak/presentation/widget/common/pill_detail_dialog.dart';
import 'package:yak/presentation/widget/medication_schedule/medication_schedule_time_button.dart';
import 'package:yak/presentation/widget/pill/common_pill_search_dialog.dart';
import 'package:yak/presentation/widget/pill/pill_search_dialog.dart';

class MedicationSchedulesCreatePage extends StatefulWidget {
  const MedicationSchedulesCreatePage({super.key});

  @override
  State<MedicationSchedulesCreatePage> createState() => _MedicationSchedulesCreatePageState();
}

class _MedicationSchedulesCreatePageState extends State<MedicationSchedulesCreatePage> {
  final today = DateTime.now();
  late final PrescriptionCrateCubit prescriptionCrateCubit;
  late final PageController pageController;

  String searchText = '';

  @override
  void initState() {
    prescriptionCrateCubit = PrescriptionCrateCubit(
      createPrescription: KiwiContainer().resolve<CreatePrescription>(),
    );
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    prescriptionCrateCubit.close();
    pageController.dispose();
    super.dispose();
  }

  Future<void> searchPill(String pillName) async {
    final pill = await showDialog<Pill>(
      context: context,
      builder: (_) => PillSearchDialog(pillName: pillName),
    );

    if (pill == null) return;

    prescriptionCrateCubit.addMedicationInformationCreateFormInput(pill);
  }

  Future<void> searchCommonPill() async {
    final pill = await showDialog<Pill>(
      context: context,
      builder: (_) => const CommonPillSearchDialog(),
    );

    if (pill == null) return;

    prescriptionCrateCubit.addMedicationInformationCreateFormInput(pill);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar(
          leading: const IconBackButton(),
          title: const Text('복약일정 등록'),
        ),
        body: BlocListener<PrescriptionCrateCubit, PrescriptionCrateState>(
          bloc: prescriptionCrateCubit,
          listenWhen: (previous, current) {
            if (previous.medicationInformationCreateFormInput.value.length <
                    current.medicationInformationCreateFormInput.value.length &&
                pageController.hasClients) {
              pageController.jumpToPage(
                current.medicationInformationCreateFormInput.value.length - 1,
              );
            }
            return true;
          },
          listener: (context, state) {
            if (state.status == FormzStatus.submissionInProgress) {
              showDialog<void>(
                context: context,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            }

            if (state.status == FormzStatus.submissionSuccess) {
              Navigator.of(context).pop();
              context.beamBack();
            }
          },
          child: BlocBuilder<PrescriptionCrateCubit, PrescriptionCrateState>(
            bloc: prescriptionCrateCubit,
            builder: (context, state) => SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
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
                          '''복약일정을 직접 등록하는 화면입니다\n처방전을 스캔하여 등록하고자 하면 하단의 처방전 스캔을 선택하여 복약일정을 등록하세요.''',
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.3,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 49,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        CommonInputDateField(
                          onTap: () => openDatePicker(
                            context: context,
                            initialValue: DateTime.now(),
                            minTime: DateTime.now().add(
                              const Duration(days: -365),
                            ),
                          ).then(prescriptionCrateCubit.updatePrescriptedAt),
                          label: '처방일자',
                          dateFormat: yyyyMMddFormat,
                          dateTime: state.prescriptedAt.value,
                        ),
                        const SizedBox(height: 16),
                        JoinContainer(
                          label: '처방의',
                          color: Colors.white,
                          child: CommonInputFormField(
                            onChanged: prescriptionCrateCubit.updateDoctorName,
                            initialValue: state.doctorName.value,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              '복약기간    오늘',
                              style: const TextStyle(
                                color: AppColors.gray,
                                fontSize: 13,
                              ).rixMGoB,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              yyyyMMddFormat.format(today),
                              style: GoogleFonts.lato(
                                color: Theme.of(context).primaryColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 48,
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonInputDateField(
                                  onTap: () => openDatePicker(
                                    context: context,
                                    maxTime: DateTime.now().add(const Duration(days: 365)),
                                    minTime: state.prescriptedAt.value ??
                                        DateTime.now().add(
                                          const Duration(days: -365),
                                        ),
                                  ).then(
                                    prescriptionCrateCubit.updateMedicatedAt,
                                  ),
                                  dateFormat: yyyyMMddFormat,
                                  dateTime: state.medicationStartAt.value,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '부터',
                                style: const TextStyle(
                                  color: AppColors.gray,
                                  fontSize: 13,
                                ).rixMGoB,
                              ),
                              const SizedBox(width: 40),
                              SizedBox(
                                width: 66,
                                child: JoinContainer(
                                  color: Colors.white,
                                  child: CommonInputFormField(
                                    onChanged: (str) => prescriptionCrateCubit.updateDuration(
                                      int.tryParse(str),
                                    ),
                                    initialValue: state.duration.value == null ? '' : '${state.duration.value}',
                                    keyboardType: const TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: true,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^([1-9]\d{0,2})?'),
                                      ),
                                    ],
                                    textStyle: GoogleFonts.lato(
                                      fontSize: 22,
                                      color: AppColors.blueGrayDark,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '일',
                                style: const TextStyle(
                                  color: AppColors.gray,
                                  fontSize: 13,
                                ).rixMGoB,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 49,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        StatefulBuilder(
                          builder: (context, setState) => JoinContainer(
                            labelWidget: Row(
                              children: [
                                Text(
                                  '약제 검색',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.gray,
                                  ).rixMGoB,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: searchCommonPill,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/icon_preset.svg',
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '자주 사용하는 약제',
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 13,
                                        ).rixMGoB,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonInputFormField(
                                    onChanged: (p0) => setState(() => searchText = p0),
                                    onFieldSubmitted: searchPill,
                                    initialValue: searchText,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => searchPill(searchText),
                                  icon: SvgPicture.asset(
                                    'assets/svg/search.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.medicationInformationCreateFormInput.value.isNotEmpty) ...[
                    ExpandablePageView.builder(
                      controller: pageController,
                      itemCount: state.medicationInformationCreateFormInput.value.length,
                      itemBuilder: (context, index) {
                        final formInput = state.medicationInformationCreateFormInput.value.elementAt(index);
                        return MedicationInformationCreateFormWidget(
                          formInput: formInput,
                          onChanged: prescriptionCrateCubit.updateMedicationInformationCreateForm,
                          onDelete: prescriptionCrateCubit.deleteMedicationInformationCreateForm,
                        );
                      },
                    ),
                    PageIndexIndicator(
                      pageController: pageController,
                      pageCount: state.medicationInformationCreateFormInput.value.length,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: state.status != FormzStatus.valid ? null : prescriptionCrateCubit.submit,
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          '복약일정 저장',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ).rixMGoEB,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MedicationInformationCreateFormWidget extends StatelessWidget {
  const MedicationInformationCreateFormWidget({
    super.key,
    required this.formInput,
    required this.onChanged,
    this.onDelete,
  });

  final MedicationInformationCreateForm formInput;
  final void Function(MedicationInformationCreateForm) onChanged;
  final void Function(String pillId)? onDelete;

  @override
  Widget build(BuildContext context) {
    return CommonShadowBox(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(24).copyWith(
                right: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: formInput.pill.name,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ).rixMGoEB,
                          ),
                          WidgetSpan(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () async {
                                    final pill =
                                        await KiwiContainer().resolve<PillLocalDataSource>().getPill(formInput.pill.id);
                                    await showDialog<void>(
                                      context: context,
                                      builder: (_) => PillDetailDialog(
                                        pill: Pill.fromJson(pill.toJson()),
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    'assets/svg/icon_info.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (onDelete != null)
                    IconButton(
                      onPressed: () => onDelete?.call(formInput.pill.id),
                      icon: Container(
                        alignment: Alignment.center,
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.magenta,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/close.svg',
                          width: 12,
                          height: 12,
                          color: AppColors.magenta,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Text(
                  '복용량 (알약수/회)',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.gray,
                  ).rixMGoB,
                ),
                const Spacer(),
                IgnorePointer(
                  ignoring: onDelete == null,
                  child: SizedBox(
                    width: 66,
                    child: JoinContainer(
                      child: CommonInputFormField(
                        onChanged: (str) {
                          final takeCount = double.tryParse(str);

                          if (takeCount == null) return;

                          onChanged(
                            formInput.copyWith(
                              takeCount: Optional.value(takeCount),
                            ),
                          );
                        },
                        initialValue: '${formInput.takeCount ?? ''}',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: true,
                        ),
                        inputFormatters: [
                          doubleTextInputFormatter,
                        ],
                        textStyle: GoogleFonts.lato(
                          fontSize: 22,
                          color: AppColors.blueGrayDark,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 12,
                  children: List.generate(
                    24,
                    (index) {
                      final hour = index + 1;
                      final isSelected = formInput.times?.contains(hour) ?? false;
                      return MedicationScheduleTimeButton(
                        onTap: () {
                          final times = List<int>.from(
                            formInput.times ?? <int>[],
                          );

                          final isSelected = times.contains(hour);

                          if (isSelected) {
                            times.remove(hour);
                          } else {
                            times.add(hour);
                          }

                          if (times.length > 3) return;

                          onChanged(
                            formInput.copyWith(
                              times: Optional<List<int>>.value(
                                times
                                  ..sort(
                                    (prev, curr) => prev.compareTo(curr),
                                  ),
                              ),
                            ),
                          );
                        },
                        hour: hour,
                        isSelected: isSelected,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '복용주기',
                  style: const TextStyle(
                    color: AppColors.gray,
                    fontSize: 13,
                  ).rixMGoB,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) {
                      final takeCycle = [1, 2, 3, 7][index];
                      return Row(
                        children: [
                          IgnorePointer(
                            ignoring: onDelete == null,
                            child: OpacityCheckButton(
                              onTap: () => onChanged(
                                formInput.copyWith(
                                  takeCycle: Optional<int>.value(
                                    formInput.takeCycle == takeCycle ? null : takeCycle,
                                  ),
                                ),
                              ),
                              opacity: formInput.takeCycle == takeCycle ? 1 : 0,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ['매일', '2일', '3일', '7일'][index],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ).rixMGoB,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '알림설정',
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.primary,
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
                      value: formInput.beforePush == true || formInput.afterPush == true,
                      onToggle: (value) => onChanged(
                        formInput.copyWith(
                          afterPush: Optional.value(value),
                          beforePush: Optional.value(value),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    OpacityCheckButton(
                      onTap: () => onChanged(
                        formInput.copyWith(
                          beforePush: Optional.value(
                            !(formInput.beforePush == true),
                          ),
                        ),
                      ),
                      opacity: formInput.beforePush == true ? 1 : 0,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '30분 전 알림',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ).rixMGoB,
                    ),
                    const Spacer(),
                    OpacityCheckButton(
                      onTap: () => onChanged(
                        formInput.copyWith(
                          afterPush: Optional.value(
                            !(formInput.afterPush == true),
                          ),
                        ),
                      ),
                      opacity: formInput.afterPush == true ? 1 : 0,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '30분 후 알림',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ).rixMGoB,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
