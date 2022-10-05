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
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/functions.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/domain/usecases/prescription/create_prescriotion.dart';
import 'package:yak/presentation/bloc/prescription/create/prescription_create_cubit.dart';
import 'package:yak/presentation/page/medication_schedule/medication_schedules_create_page.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_input_date_field.dart';
import 'package:yak/presentation/widget/common/common_input_form_field.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';
import 'package:yak/presentation/widget/common/page_index_indicator.dart';
import 'package:yak/presentation/widget/pill/pill_search_dialog.dart';

class PrescriptionCreatePage extends StatefulWidget {
  const PrescriptionCreatePage({super.key});

  @override
  State<PrescriptionCreatePage> createState() => _PrescriptionCreatePageState();
}

class _PrescriptionCreatePageState extends State<PrescriptionCreatePage> {
  final today = DateTime.now();
  late final PrescriptionCrateCubit prescriptionCrateCubit;
  late final PageController pageController;
  final _picker = ImagePicker();
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);
  String searchText = '';

  @override
  void initState() {
    prescriptionCrateCubit = PrescriptionCrateCubit(
      createPrescription: KiwiContainer().resolve<CreatePrescription>(),
    );
    pageController = PageController();
    extractText();
    super.initState();
  }

  @override
  void dispose() {
    prescriptionCrateCubit.close();
    pageController.dispose();
    super.dispose();
  }

  Future<XFile?> pickImage() => _picker.pickImage(source: ImageSource.camera);

  Future<CroppedFile?> cropImage(XFile file) => ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );

  Future<void> searchPill(String pillName) async {
    final pill = await showDialog<Pill>(
      context: context,
      builder: (_) => PillSearchDialog(pillName: pillName),
    );

    if (pill == null) return;

    prescriptionCrateCubit.addMedicationInformationCreateFormInput(pill);
  }

  Future<void> extractText() async {
    final image = await pickImage();

    if (image == null) return;
    final cropedImage = await cropImage(image);

    if (cropedImage == null) return;

    final recognizedText = await textRecognizer.processImage(
      InputImage.fromFilePath(cropedImage.path),
    );

    for (final block in recognizedText.blocks) {
      await searchPill(block.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar(
          leading: const IconBackButton(),
          title: const Text('처방전 등록'),
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
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
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
                          '''처방전을 스캔한 결과입니다.\n일부 정보가 정확하지 않을 수 있습니다.\n처방전과 확인하고 등록하시기 바랍니다.''',
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
                                    maxTime: DateTime.now()
                                        .add(const Duration(days: 365)),
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
                                    onChanged: (str) =>
                                        prescriptionCrateCubit.updateDuration(
                                      int.tryParse(str),
                                    ),
                                    initialValue: state.duration.value == null
                                        ? ''
                                        : '${state.duration.value}',
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
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
                  if (state.medicationInformationCreateFormInput.value
                      .isNotEmpty) ...[
                    ExpandablePageView.builder(
                      controller: pageController,
                      itemCount: state
                          .medicationInformationCreateFormInput.value.length,
                      itemBuilder: (context, index) {
                        final formInput = state
                            .medicationInformationCreateFormInput.value
                            .elementAt(index);
                        return MedicationInformationCreateFormWidget(
                          formInput: formInput,
                          onChanged: prescriptionCrateCubit
                              .updateMedicationInformationCreateForm,
                          onDelete: prescriptionCrateCubit
                              .deleteMedicationInformationCreateForm,
                        );
                      },
                    ),
                    PageIndexIndicator(
                      pageController: pageController,
                      pageCount: state
                          .medicationInformationCreateFormInput.value.length,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: state.status != FormzStatus.valid
                            ? null
                            : prescriptionCrateCubit.submit,
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
