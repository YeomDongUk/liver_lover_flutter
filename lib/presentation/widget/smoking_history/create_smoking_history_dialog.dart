// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/smoking_history/smoking_history.dart';
import 'package:yak/domain/usecases/smoking_history/upsert_smoking_history.dart';
import 'package:yak/presentation/bloc/smoking_histories/create/create_smoking_history_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/auth/join/join_input_form_field.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class CreateSmokingHistoryDialog extends StatefulWidget {
  const CreateSmokingHistoryDialog({
    super.key,
    required this.onCreate,
    required this.date,
  });
  final DateTime date;
  final void Function(SmokingHistory) onCreate;

  @override
  State<CreateSmokingHistoryDialog> createState() =>
      _CreateSmokingHistoryDialogState();
}

class _CreateSmokingHistoryDialogState
    extends State<CreateSmokingHistoryDialog> {
  late final CreateSmokingHistoryCubit createSmokingHistoryCubit;
  late final FocusNode focusNode;

  @override
  void initState() {
    createSmokingHistoryCubit = CreateSmokingHistoryCubit(
      date: widget.date,
      upsertSmokingHistory: KiwiContainer().resolve<UpsertSmokingHistory>(),
    );
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    createSmokingHistoryCubit.close();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateSmokingHistoryCubit, CreateSmokingHistoryState>(
      bloc: createSmokingHistoryCubit,
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
                    '흡연량 등록',
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                    ).rixMGoEB,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '하루 흡연한 양(개비)을 등록하세요.',
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
                        '흡연량(개비)',
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
                          child: JoinInputFormField(
                            onChanged: (str) => createSmokingHistoryCubit
                                .updateAmount(int.tryParse(str)),
                            initialValue: '',
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
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<CreateSmokingHistoryCubit,
                  CreateSmokingHistoryState>(
                bloc: createSmokingHistoryCubit,
                builder: (context, state) => ElevatedButton(
                  onPressed: state.status != FormzStatus.valid
                      ? null
                      : () async {
                          final drinkHistory =
                              await createSmokingHistoryCubit.submit();
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
