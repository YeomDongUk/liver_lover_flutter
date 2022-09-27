// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/survey/medication_adherence_survey_answer/get_medication_adherence_survey_answers.dart';
import 'package:yak/presentation/bloc/medication_adherence_survey/medication_adherence_answers_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/sf_12_survey/survey_question_list_tile.dart';

class MedicationAdherenceSurveyAnswerDetailPage extends StatefulWidget {
  const MedicationAdherenceSurveyAnswerDetailPage({
    super.key,
    required this.surveyId,
  });

  final String surveyId;

  @override
  State<MedicationAdherenceSurveyAnswerDetailPage> createState() =>
      _MedicationAdherenceSurveyAnswerPageSDetailtate();
}

class _MedicationAdherenceSurveyAnswerPageSDetailtate
    extends State<MedicationAdherenceSurveyAnswerDetailPage> {
  late final MedicationAdherenceAnswersCubit medicationAdherenceAnswersCubit;

  @override
  void initState() {
    medicationAdherenceAnswersCubit = MedicationAdherenceAnswersCubit(
      surveyId: widget.surveyId,
      getMedicationAdherenceSurveyAnswers:
          KiwiContainer().resolve<GetMedicationAdherenceSurveyAnswers>(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    medicationAdherenceAnswersCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        automaticallyImplyLeading: false,
        title: const Text('복약순응도'),
        actions: [
          IconButton(
            onPressed: context.beamBack,
            icon: SvgPicture.asset('assets/svg/close.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MedicationAdherenceAnswersCubit,
            MedicationAdherenceAnswersState>(
          bloc: medicationAdherenceAnswersCubit,
          builder: (context, state) {
            if (state.status == MedicationAdherenceAnswersStatus.initial ||
                state.status ==
                    MedicationAdherenceAnswersStatus.loadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == MedicationAdherenceAnswersStatus.loadFailure) {
              return const Center(child: Text('로딩 실패'));
            }

            return ListView(
              children: [
                const SizedBox(height: 24),
                Column(
                  children: [
                    Text(
                      '완료된 설문입니다.',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 13,
                      ).rixMGoB,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      reservedAtDateFormat
                          .format(state.answers.first.createdAt),
                      style: GoogleFonts.lato(
                        color: AppColors.blueGrayDark,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x7ecdced2),
                        blurRadius: 20,
                      )
                    ],
                    color: AppColors.primary,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          '귀하의 복약순응도는',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 17,
                          ).rixMGoB,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          '${state.point}',
                          style: GoogleFonts.lato(
                            color: AppColors.skyBlue,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          '점입니다.(8점 만점)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 17,
                          ).rixMGoB,
                        ),
                      )
                    ],
                  ),
                ),
                CommonShadowBox(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    itemCount: medicationAdherenceSurveyQuestions.length,
                    itemBuilder: (context, index) {
                      final medicationAdherencesurveyQuestion =
                          medicationAdherenceSurveyQuestions[index];

                      return SurveyQuestionListTile<String>(
                        done: true,
                        surveyQuestion: medicationAdherencesurveyQuestion,
                        answer: '${state.answers[index].answer}',
                        setAnswer: null,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 1,
                      height: 43,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
