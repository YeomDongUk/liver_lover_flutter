// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/health_question/update_health_question.dart';
import 'package:yak/presentation/bloc/health_questions/health_questions_cubit.dart';
import 'package:yak/presentation/bloc/health_questions/write_health_question/write_health_question_answer_cubit.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';

class HealthQuestionPage extends StatefulWidget {
  const HealthQuestionPage({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<HealthQuestionPage> createState() => _HealthQuestionPageState();
}

class _HealthQuestionPageState extends State<HealthQuestionPage> {
  late final FocusNode focusNode;
  late final WriteHealthQuestionAnswerCubit writeHealthQuestionAnswerCubit;
  @override
  void initState() {
    focusNode = FocusNode();
    writeHealthQuestionAnswerCubit = WriteHealthQuestionAnswerCubit(
      id: widget.id,
      updateHealthQuestion: KiwiContainer().resolve<UpdateHealthQuestion>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    writeHealthQuestionAnswerCubit.close();
    super.dispose();
  }

  Future<void> onTapWriteHealthQuestionBtn() async {
    final focusScopeNode = FocusScope.of(context);
    final beamer = Beamer.of(context);
    final healthQuestion = await writeHealthQuestionAnswerCubit.submit();

    if (healthQuestion != null && mounted) {
      context.read<HealthQuestionsCubit>().onUpdate(healthQuestion);

      focusScopeNode.unfocus();
      beamer.beamBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonAppBar(
          automaticallyImplyLeading: false,
          title: const Text('질문조회'),
          actions: [
            IconButton(
              onPressed: context.beamBack,
              icon: SvgPicture.asset('assets/svg/close.svg'),
            ),
          ],
        ),
        body: BlocBuilder<HealthQuestionsCubit, HealthQuestionsState>(
          builder: (context, state) {
            final healthQuestion = state.healthQuestions.firstWhereOrNull(
              (healthQuestion) => healthQuestion.id == widget.id,
            );

            if (healthQuestion == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return BlocListener<WriteHealthQuestionAnswerCubit,
                WriteHealthQuestionAnswerState>(
              bloc: writeHealthQuestionAnswerCubit,
              listener: (context, state) {
                if (state.status == FormzStatus.submissionInProgress) {
                  showDialog<void>(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state.status == FormzStatus.submissionFailure) {
                  Navigator.of(context).pop();
                }
              },
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      CommonShadowBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        yyyyMMddFormat
                                            .format(healthQuestion.createdAt),
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      Text(
                                        hhmmFormat
                                            .format(healthQuestion.createdAt),
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
                                  height: 1.4,
                                ).rixMGoM,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (healthQuestion.answer == null &&
                                healthQuestion.doctorName == null) ...[
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context.beamToNamed(
                                              '${Routes.healthQuestions}/${healthQuestion.id}/update',
                                              data: <String, dynamic>{
                                                'healthQuestion': healthQuestion
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.gray,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          child: const Text('질문 수정'),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () => context
                                              .read<HealthQuestionsCubit>()
                                              .deleteHealthQuestion
                                              .call(widget.id)
                                              .then(
                                            (value) {
                                              context
                                                  .read<HealthQuestionsCubit>()
                                                  .onDelete(widget.id);
                                              context.beamBack();
                                            },
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.gray,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          child: const Text('질문 삭제'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (healthQuestion.answer != null &&
                          healthQuestion.doctorName != null)
                        CommonShadowBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      yyyyMMddFormat
                                          .format(healthQuestion.createdAt),
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(height: 1),
                                    Text(
                                      hhmmFormat
                                          .format(healthQuestion.createdAt),
                                      style: GoogleFonts.lato(
                                        fontSize: 13,
                                        color: AppColors.gray,
                                        fontWeight: FontWeight.w900,
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
                                child: Row(
                                  children: [
                                    Text(
                                      '답변 작성자(담당의)',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: AppColors.gray,
                                      ).rixMGoM,
                                    ),
                                    Expanded(
                                      child: Text(
                                        healthQuestion.doctorName!,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Theme.of(context).primaryColor,
                                        ).rixMGoEB,
                                        textAlign: TextAlign.end,
                                        maxLines: 1,
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
                                child: Text(
                                  healthQuestion.answer!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4,
                                  ).rixMGoM,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Expanded(
                          child: CommonShadowBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: TextField(
                                    onChanged: writeHealthQuestionAnswerCubit
                                        .updateDoctorName,
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: '답변 작성자(담당의)',
                                      hintStyle: TextStyle(
                                        color: AppColors.gray,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ).rixMGoEB,
                                  ),
                                ),
                                const Divider(),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: TextField(
                                      onChanged: writeHealthQuestionAnswerCubit
                                          .updateAnswer,
                                      focusNode: focusNode,
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        border: InputBorder.none,
                                        hintText: '담당의가 답변을 작성해 주세요.',
                                        hintMaxLines: 5,
                                        hintStyle: TextStyle(
                                          color: AppColors.blueGrayDark,
                                        ),
                                        isDense: true,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.4,
                                      ).rixMGoM,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: BlocBuilder<
                                      WriteHealthQuestionAnswerCubit,
                                      WriteHealthQuestionAnswerState>(
                                    bloc: writeHealthQuestionAnswerCubit,
                                    builder: (context, state) => ElevatedButton(
                                      onPressed:
                                          state.status != FormzStatus.valid
                                              ? null
                                              : onTapWriteHealthQuestionBtn,
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        fixedSize: const Size.fromHeight(60),
                                        textStyle:
                                            const TextStyle(fontSize: 17),
                                      ),
                                      child: const Text('답변 등록'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
