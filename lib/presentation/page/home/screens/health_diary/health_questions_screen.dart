import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/usecases/health_question/delete_health_question.dart';
import 'package:yak/domain/usecases/health_question/get_health_questions.dart';
import 'package:yak/presentation/bloc/health_questions/health_questions_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';

class HealthQuestionsScreen extends StatefulWidget {
  const HealthQuestionsScreen({super.key});

  @override
  State<HealthQuestionsScreen> createState() => _HealthQuestionsScreenState();
}

class _HealthQuestionsScreenState extends State<HealthQuestionsScreen>
    with AutomaticKeepAliveClientMixin {
  late final HealthQuestionsCubit healthQuestionsCubit;

  @override
  void initState() {
    healthQuestionsCubit = HealthQuestionsCubit(
      getHealthQuestions: KiwiContainer().resolve<GetHealthQuestions>(),
      deleteHealthQuestion: KiwiContainer().resolve<DeleteHealthQuestion>(),
    )..loadHealthQuestions();
    super.initState();
  }

  @override
  void dispose() {
    healthQuestionsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<HealthQuestionsCubit>.value(
      value: healthQuestionsCubit,
      child: BlocBuilder<HealthQuestionsCubit, HealthQuestionsState>(
        bloc: healthQuestionsCubit,
        builder: (context, state) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          itemCount: healthQuestionsCubit.state.healthQuestions.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '담당의에게 궁금한\n내용이 있으신가요?',
                      style: TextStyle(
                        fontSize: 28,
                        color: Theme.of(context).primaryColor,
                      ).rixMGoL,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '실시간 질의응답은 아닙니다. 질문할 내용을 저장하시고 진료일에 질문내용을 담당의에게 보여주세요.',
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.gray,
                        height: 1.2,
                      ).rixMGoL,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => context.beamToNamed(
                        Routes.healthQuestionCreate,
                        data: healthQuestionsCubit.onCreate,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        fixedSize: const Size.fromHeight(60),
                        textStyle: const TextStyle(fontSize: 17),
                      ),
                      child: const Text('궁금해요'),
                    ),
                  ],
                ),
              );
            }

            return HealthQuestionListTile(
              healthQuestion: state.healthQuestions[index - 1],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HealthQuestionListTile extends StatelessWidget {
  const HealthQuestionListTile({
    super.key,
    required this.healthQuestion,
  });
  final HealthQuestion healthQuestion;

  @override
  Widget build(BuildContext context) {
    return CommonShadowBox(
      child: Material(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: InkWell(
          onTap: () => context.beamToNamed(
            '${Routes.healthQuestions}/${healthQuestion.id}',
            data: <String, dynamic>{
              'healthQuestion': healthQuestion,
              'onUpdate': context.read<HealthQuestionsCubit>().onUpdate,
            },
          ),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          yyyyMMddFormat.format(healthQuestion.createdAt),
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          hhmmFormat.format(healthQuestion.createdAt),
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/svg/check.svg',
                      color: healthQuestion.answer == null
                          ? null
                          : AppColors.green,
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
                child: Text(
                  healthQuestion.qusetion,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.blueGrayDark,
                    height: 1.4,
                  ).rixMGoM,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
