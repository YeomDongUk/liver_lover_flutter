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
import 'package:yak/domain/usecases/survey/sf_12_survey_answer/get_sf_12_survey_answers.dart';
import 'package:yak/presentation/bloc/sf_12_survey/answer/sf_12_answers_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/sf_12_survey/sf_12_survey_question_list_tile.dart';

class SF12SurveyAnswerDetailPage extends StatefulWidget {
  const SF12SurveyAnswerDetailPage({
    super.key,
    required this.surveyId,
  });
  final String surveyId;

  @override
  State<SF12SurveyAnswerDetailPage> createState() =>
      _SF12SurveyAnswerDetailPageState();
}

class _SF12SurveyAnswerDetailPageState
    extends State<SF12SurveyAnswerDetailPage> {
  late final SF12AnswersCubit sf12answersCubit;

  @override
  void initState() {
    sf12answersCubit = SF12AnswersCubit(
      surveyId: widget.surveyId,
      getSF12SurveyAnswers: KiwiContainer().resolve<GetSF12SurveyAnswers>(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    sf12answersCubit.close();
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
        child: BlocBuilder<SF12AnswersCubit, SF12AnswersState>(
          bloc: sf12answersCubit,
          builder: (context, state) {
            if (state.status == SF12AnswersStatus.initial ||
                state.status == SF12AnswersStatus.loadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == SF12AnswersStatus.loadFailure) {
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
                CommonShadowBox(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                      return SF12SurveyQuestionListTile(
                        done: true,
                        setAnswer: null,
                        sf12surveyQuestion: sf12surveyQuestion,
                        answers: state.answers[index - 1].answers
                            .map((e) => '$e')
                            .toList(),
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
