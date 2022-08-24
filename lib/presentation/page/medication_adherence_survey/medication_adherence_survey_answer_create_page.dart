// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/survey/medication_adherence_survey_answer/create_medication_adherence_survey_answers.dart';
import 'package:yak/presentation/bloc/medication_adherence_survey/create/medication_adherence_survey_create_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/sf_12_survey/survey_question_list_tile.dart';

class MedicationAdherenceSurveyAnswerCreatePage extends StatefulWidget {
  const MedicationAdherenceSurveyAnswerCreatePage({
    super.key,
    required this.surveyId,
  });

  final String surveyId;

  @override
  State<MedicationAdherenceSurveyAnswerCreatePage> createState() =>
      _MedicationAdherenceSurveyAnswerPageSCreatetate();
}

class _MedicationAdherenceSurveyAnswerPageSCreatetate
    extends State<MedicationAdherenceSurveyAnswerCreatePage> {
  late final MedicationAdherenceSurveyAnswerCreateCubit
      medicationAdherenceSurveyAnswerCreateCubit;

  @override
  void initState() {
    medicationAdherenceSurveyAnswerCreateCubit =
        MedicationAdherenceSurveyAnswerCreateCubit(
      surveyId: widget.surveyId,
      createMedicationAdherenceSurveyAnswers:
          KiwiContainer().resolve<CreateMedicationAdherenceSurveyAnswers>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    medicationAdherenceSurveyAnswerCreateCubit.close();
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
        child: BlocBuilder<MedicationAdherenceSurveyAnswerCreateCubit,
            MedicationAdherenceSurveyAnswerCreateState>(
          bloc: medicationAdherenceSurveyAnswerCreateCubit,
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CommonShadowBox(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    itemCount: medicationAdherenceSurveyQuestions.length,
                    itemBuilder: (context, index) {
                      final medicationAdherencesurveyQuestion =
                          medicationAdherenceSurveyQuestions[index];
                      return SurveyQuestionListTile<String>(
                        done: false,
                        surveyQuestion: medicationAdherencesurveyQuestion,
                        answer: state.answers[index],
                        setAnswer: (answer) =>
                            medicationAdherenceSurveyAnswerCreateCubit
                                .updateAnswer(
                          id: medicationAdherencesurveyQuestion.id,
                          answer: answer,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 1,
                      height: 43,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: state.canSubmit
                    ? () async {
                        final surveyGroupsCubit =
                            context.read<SurveyGroupsCubit>();
                        final rowCount =
                            await medicationAdherenceSurveyAnswerCreateCubit
                                .submit();
                        if (rowCount == null) return;

                        surveyGroupsCubit.updateMedicationAdherenceSurvey(
                          medicationAdherenceSurveyId: widget.surveyId,
                        );

                        if (mounted) Beamer.of(context).beamBack();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(70),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ).rixMGoB,
                ),
                child: const Text('제출'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
