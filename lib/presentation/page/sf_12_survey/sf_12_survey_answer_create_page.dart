// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/create_sf_12_survey_answers.dart';
import 'package:yak/presentation/bloc/sf_12_survey/answer/create/sf_12_survey_cubit.dart';
import 'package:yak/presentation/bloc/survey_groups/survey_groups_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/sf_12_survey/survey_question_list_tile.dart';

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
      appBar: CommonAppBar(
        automaticallyImplyLeading: false,
        title: const Text('삶의 질(SF-12)'),
        actions: [
          IconButton(
            onPressed: context.beamBack,
            icon: SvgPicture.asset('assets/svg/close.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<SF12SurveyAnswerCreateCubit,
            SF12SurveyAnswerCreateState>(
          bloc: sf12SurveyAnswerCreateCubit,
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CommonShadowBox(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    itemCount: sf12Questions.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                '한국어판 건강 관련 삶의 질 평가 척도',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                ).rixMGoEB,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '''귀하의 건강 상태에 대한 귀하의 의견을 묻는 것입니다. 귀하의 대답은 귀하가 어떻게 느끼고 또한 일상 활동을 얼마나 잘 할 수 있는가를 계속적으로 관찰하는 데 도움이 됩니다. 가장 적합한 숫자에 표시해 주십시오.''',
                                style: const TextStyle(
                                  color: AppColors.blueGrayDark,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  height: 1.2,
                                ).rixMGoM,
                              )
                            ],
                          ),
                        );
                      }

                      final sf12surveyQuestion = sf12Questions[index - 1];
                      return SurveyQuestionListTile<List<String>>(
                        done: false,
                        surveyQuestion: sf12surveyQuestion,
                        answer: state.answers[index - 1],
                        setAnswer: (answer) =>
                            sf12SurveyAnswerCreateCubit.updateAnswer(
                          id: sf12surveyQuestion.id,
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
