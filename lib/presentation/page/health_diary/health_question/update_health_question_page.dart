import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/health_question/health_question.dart';
import 'package:yak/domain/usecases/health_question/write_health_question.dart';
import 'package:yak/presentation/bloc/health_questions/write/health_question_write_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';

class UpdateHealthQuestionPage extends StatefulWidget {
  const UpdateHealthQuestionPage({
    super.key,
    required this.id,
    required this.healthQuestion,
    required this.onUpdate,
  });
  final String id;
  final HealthQuestion healthQuestion;
  final void Function(HealthQuestion healthQuestion)? onUpdate;
  @override
  State<UpdateHealthQuestionPage> createState() =>
      _UpdateHealthQuestionPageState();
}

class _UpdateHealthQuestionPageState extends State<UpdateHealthQuestionPage> {
  late final WriteHealthQuestionCubit writeHealthQuestionCubit;
  late final FocusNode focusNode;

  @override
  void initState() {
    writeHealthQuestionCubit = WriteHealthQuestionCubit(
      healthQuestion: widget.healthQuestion,
      writeHealthQuestion: KiwiContainer().resolve<WriteHealthQuestion>(),
    );
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    writeHealthQuestionCubit.close();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          leading: const IconBackButton(),
          title: const Text('질문수정'),
        ),
        body: BlocBuilder<WriteHealthQuestionCubit, WriteHealthQuestionState>(
          bloc: writeHealthQuestionCubit,
          builder: (context, state) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: focusNode.requestFocus,
                    child: CommonShadowBox(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        autofocus: true,
                        focusNode: focusNode,
                        onChanged: writeHealthQuestionCubit.updateQuestion,
                        maxLines: null,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText:
                              '실시간 질의응답은 아닙니다.\n질문할 내용을 저장하시고 진료일에 질문내용을 담당의에게 보여주세요.',
                          hintMaxLines: 5,
                          hintStyle: TextStyle(color: AppColors.blueGrayDark),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.4,
                        ).rixMGoM,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed:
                      writeHealthQuestionCubit.state.status != FormzStatus.valid
                          ? null
                          : () async {
                              final beamer = Beamer.of(context);
                              final healthQuestion =
                                  await writeHealthQuestionCubit.submit();

                              if (healthQuestion != null) {
                                widget.onUpdate?.call(healthQuestion);
                                beamer.beamBack();
                              }
                            },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    fixedSize: const Size.fromHeight(60),
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                  child: const Text('확인'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
