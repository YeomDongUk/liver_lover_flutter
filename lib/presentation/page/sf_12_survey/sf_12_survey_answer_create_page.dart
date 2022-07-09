import 'package:beamer/beamer.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/create_sf_12_survey_answers.dart';
import 'package:yak/presentation/bloc/sf_12_survey/sf_12_survey_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/sf_12_survey/sf_12_survey_question_list_tile.dart';

class SF12SurveyAnswerCreatePage extends StatefulWidget {
  const SF12SurveyAnswerCreatePage({super.key, required this.surveyId});
  final String surveyId;
  @override
  State<SF12SurveyAnswerCreatePage> createState() =>
      _SF12SurveyAnswerPageSCreatetate();
}

class _SF12SurveyAnswerPageSCreatetate
    extends State<SF12SurveyAnswerCreatePage> {
  late final SF12SurveyAnswerCreateCubit sf12SurveyAnswerCreateCubit;

  @override
  void initState() {
    sf12SurveyAnswerCreateCubit = SF12SurveyAnswerCreateCubit(
      surveyId: widget.surveyId,
      createSF12SurveyAnswers:
          KiwiContainer().resolve<CreateSF12SurveyAnswers>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    sf12SurveyAnswerCreateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SF12SurveyAnswerCreateCubit,
            SF12SurveyAnswerCreateState>(
          bloc: sf12SurveyAnswerCreateCubit,
          builder: (context, state) => ListView(
            children: [
              ...sf12Questions
                  .mapIndexed(
                    (i, e) => SF12SurveyQuestionListTile(
                      sf12surveyQuestion: e,
                      answers: state.answers[i],
                      setAnswer: (answer) =>
                          sf12SurveyAnswerCreateCubit.updateAnswer(
                        id: e.id,
                        answer: answer,
                      ),
                    ),
                  )
                  .toList(),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: state.canSubmit
                    ? () async {
                        final beamer = Beamer.of(context);
                        final surveyGroupsCubit =
                            context.read<SurveyGroupsCubit>();
                        final rowCount =
                            await sf12SurveyAnswerCreateCubit.submit();
                        if (rowCount == null) return;

                        surveyGroupsCubit.updateSF12Survey(
                          sf12SurveyId: widget.surveyId,
                        );

                        beamer.beamBack();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(70),
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
