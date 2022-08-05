// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/drinking_history/drinking_history.dart';
import 'package:yak/domain/usecases/drinking_history/upsert_drinking_history.dart';
import 'package:yak/presentation/bloc/drinking_histories/create/create_drinking_history_cubit.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/auth/join/join_input_form_field.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class CreateDrinkingHistoryDialog extends StatefulWidget {
  const CreateDrinkingHistoryDialog({
    super.key,
    required this.onCreate,
    required this.date,
  });
  final DateTime date;
  final void Function(DrinkingHistory) onCreate;

  @override
  State<CreateDrinkingHistoryDialog> createState() =>
      _CreateDrinkingHistoryDialogState();
}

class _CreateDrinkingHistoryDialogState
    extends State<CreateDrinkingHistoryDialog> {
  late final CreateDrinkingHistoryCubit createDrinkingHistoryCubit;
  late final FocusNode focusNode;

  @override
  void initState() {
    createDrinkingHistoryCubit = CreateDrinkingHistoryCubit(
      date: widget.date,
      upsertDrinkingHistory: KiwiContainer().resolve<UpsertDrinkingHistory>(),
    );
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    createDrinkingHistoryCubit.close();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateDrinkingHistoryCubit, CreateDrinkingHistoryState>(
      bloc: createDrinkingHistoryCubit,
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
                    '음주량 등록',
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                    ).rixMGoEB,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '주종 및 섭취량을 등록하면 알코올량이 계산됩니다.',
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
                        '주종',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 210,
                        height: 48,
                        child: DropdownButtonHideUnderline(
                          child: BlocBuilder<CreateDrinkingHistoryCubit,
                              CreateDrinkingHistoryState>(
                            buildWhen: (previous, current) =>
                                previous.alcoholType != current.alcoholType,
                            bloc: createDrinkingHistoryCubit,
                            builder: (context, state) =>
                                DropdownButton2<AlcoholType>(
                              icon: SvgPicture.asset('assets/svg/down.svg'),
                              buttonPadding: const EdgeInsets.only(
                                left: 10,
                                right: 12,
                              ),
                              buttonElevation: 0,
                              dropdownElevation: 0,
                              value:
                                  createDrinkingHistoryCubit.state.alcoholType,
                              onChanged: (alcoholType) => alcoholType == null
                                  ? null
                                  : createDrinkingHistoryCubit
                                      .updateAlcoholType(alcoholType),
                              buttonDecoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.lightGray,
                                ),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              dropdownDecoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.lightGray,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              items: AlcoholType.values
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        '${e.name} (${e.amount}ml)',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ).rixMGoB,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '섭취량',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.gray,
                        ).rixMGoB,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 210,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 48,
                              child: JoinContainer(
                                child: JoinInputFormField(
                                  onChanged: (str) => createDrinkingHistoryCubit
                                      .updateAmount(double.tryParse(str)),
                                  initialValue: '',
                                  focusNode: focusNode,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: true,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,1}'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '한병은 1, 한병 반은 1.5로 입력하세요',
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.gray,
                              ).rixMGoB,
                            ),
                          ],
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
              child: BlocBuilder<CreateDrinkingHistoryCubit,
                  CreateDrinkingHistoryState>(
                bloc: createDrinkingHistoryCubit,
                builder: (context, state) => ElevatedButton(
                  onPressed: state.status != FormzStatus.valid
                      ? null
                      : () async {
                          final drinkHistory =
                              await createDrinkingHistoryCubit.submit();
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
