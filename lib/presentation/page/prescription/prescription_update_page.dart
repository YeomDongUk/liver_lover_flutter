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
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/prescription/prescription.dart';
import 'package:yak/domain/usecases/prescription/update_prescription.dart';
import 'package:yak/presentation/bloc/prescription/cubit/prescription_update_cubit.dart';
import 'package:yak/presentation/page/medication_schedule/medication_schedules_create_page.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_date_field.dart';
import 'package:yak/presentation/widget/common/common_input_form_field.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/page_index_indicator.dart';

class PrescriptionUpdatePage extends StatefulWidget {
  const PrescriptionUpdatePage({
    super.key,
    required this.prescription,
  });

  final Prescription prescription;

  @override
  State<PrescriptionUpdatePage> createState() => _PrescriptionUpdatePageState();
}

class _PrescriptionUpdatePageState extends State<PrescriptionUpdatePage> {
  late final PrescriptionUpdateCubit prescriptionUpdateCubit;

  final today = DateTime.now();
  late final PageController pageController;

  @override
  void initState() {
    prescriptionUpdateCubit = PrescriptionUpdateCubit(
      prescription: widget.prescription,
      updatePrescription: KiwiContainer().resolve<UpdatePrescription>(),
    );
    pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    prescriptionUpdateCubit.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar(
          leading: const IconBackButton(),
          title: const Text('처방전 수정'),
        ),
        body: BlocListener<PrescriptionUpdateCubit, PrescriptionUpdateState>(
          bloc: prescriptionUpdateCubit,
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
          child: BlocBuilder<PrescriptionUpdateCubit, PrescriptionUpdateState>(
            bloc: prescriptionUpdateCubit,
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
                          '''처방전 수정은 복약일정의 복약시간 및 알림정보만 수정이 가능합니다.\n다른정보 수정이 필요한 경우 처방전 종료 후 재등록해주세요.''',
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
                          onTap: () => null,
                          label: '처방일자',
                          dateFormat: yyyyMMddFormat,
                          dateTime: state.prescriptedAt.value,
                        ),
                        const SizedBox(height: 16),
                        JoinContainer(
                          label: '처방의',
                          color: Colors.white,
                          child: IgnorePointer(
                            child: CommonInputFormField(
                              initialValue: state.doctorName.value,
                            ),
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
                                  onTap: () => null,
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
                                  child: IgnorePointer(
                                    child: CommonInputFormField(
                                      onChanged: (str) => null,
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
                  if (state.medicationInformationCreateFormInput.value.isNotEmpty) ...[
                    ExpandablePageView.builder(
                      controller: pageController,
                      itemCount: state.medicationInformationCreateFormInput.value.length,
                      itemBuilder: (context, index) {
                        final formInput = state.medicationInformationCreateFormInput.value.elementAt(index);
                        return MedicationInformationCreateFormWidget(
                          formInput: formInput,
                          onChanged: prescriptionUpdateCubit.updateMedicationInformationCreateForm,
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
                        onPressed: state.status != FormzStatus.valid ? null : prescriptionUpdateCubit.submit,
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
