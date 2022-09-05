// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/excercise_history/excercise_history.dart';
import 'package:yak/domain/usecases/excercise_history/upsert_excercise_history.dart';
import 'package:yak/presentation/bloc/excercise_histories/create/create_excercise_history_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';
import 'package:yak/presentation/widget/common/common_input_form_field.dart';

class CreateExcerciseHistoryDialog extends StatefulWidget {
  const CreateExcerciseHistoryDialog({
    super.key,
    required this.onCreate,
    required this.date,
  });
  final DateTime date;
  final void Function(ExcerciseHistory) onCreate;

  @override
  State<CreateExcerciseHistoryDialog> createState() =>
      _CreateExcerciseHistoryDialogState();
}

class _CreateExcerciseHistoryDialogState
    extends State<CreateExcerciseHistoryDialog> {
  late final CreateExcerciseHistoryCubit createExcerciseHistoryCubit;
  late final FocusNode focusNode;
  late final FocusNode weightFocusNode;

  @override
  void initState() {
    createExcerciseHistoryCubit = CreateExcerciseHistoryCubit(
      date: widget.date,
      upsertExcerciseHistory: KiwiContainer().resolve<UpsertExcerciseHistory>(),
    );
    focusNode = FocusNode();
    weightFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    createExcerciseHistoryCubit.close();
    focusNode.dispose();
    weightFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExcerciseHistoryCubit,
        CreateExcerciseHistoryState>(
      bloc: createExcerciseHistoryCubit,
      listener: (context, state) {
        if (state.status == FormzStatus.submissionInProgress) {
          showDialog<void>(
            context: context,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.status == FormzStatus.submissionFailure ||
            state.status == FormzStatus.submissionSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: CommonDialog(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '운동량 등록',
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                    ).rixMGoEB,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '운동한 시간과 체중을 등록해주세요',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.gray,
                    ).rixMGoB,
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '운동시간(분)',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 210,
                        height: 48,
                        child: JoinContainer(
                          child: CommonInputFormField(
                            onChanged: (str) => createExcerciseHistoryCubit
                                .updateMinuite(int.tryParse(str)),
                            focusNode: focusNode,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^(\d+)?'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '꾸준히 진행된 운동시간을 등록하세요.',
                        style:
                            const TextStyle(fontSize: 13, color: AppColors.gray)
                                .rixMGoB,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '체중(kg)',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 210,
                        height: 48,
                        child: JoinContainer(
                          child: CommonInputFormField(
                            onChanged: (str) => createExcerciseHistoryCubit
                                .updateWeight(double.tryParse(str)),
                            focusNode: weightFocusNode,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            inputFormatters: [
                              doubleTextInputFormatter,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<CreateExcerciseHistoryCubit,
                  CreateExcerciseHistoryState>(
                bloc: createExcerciseHistoryCubit,
                builder: (context, state) => ElevatedButton(
                  onPressed: state.status != FormzStatus.valid
                      ? null
                      : () async {
                          final drinkHistory =
                              await createExcerciseHistoryCubit.submit();
                          if (drinkHistory == null) return;

                          widget.onCreate(drinkHistory);
                          if (mounted) Navigator.of(context).pop();
                        },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 17,
                    ).rixMGoEB,
                  ),
                  child: const Text('저장'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
