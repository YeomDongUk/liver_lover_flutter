// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/static.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/auth/join/join_container.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class UpsertNumberExaminationResultDialog extends StatefulWidget {
  const UpsertNumberExaminationResultDialog({
    super.key,
    required this.text,
    required this.unitText,
    required this.onSaved,
  });

  final String text;
  final String unitText;
  final Future<void> Function(double) onSaved;

  @override
  State<UpsertNumberExaminationResultDialog> createState() =>
      _UpsertNumberExaminationResultDialogState();
}

class _UpsertNumberExaminationResultDialogState
    extends State<UpsertNumberExaminationResultDialog> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
            ),
            const SizedBox(height: 12),
            Text(
              '측정된 수치를 입력해 주세요',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.gray,
              ).rixMGoB,
            ),
            const SizedBox(height: 24),
            JoinContainer(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        doubleTextInputFormatter,
                      ],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ).rixMGoB,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  if (widget.unitText == '/mm')
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          const TextSpan(
                            text: '10',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Transform.translate(
                              offset: const Offset(0, 2),
                              child: const Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 6,
                                ),
                              ),
                            ),
                          ),
                          const TextSpan(
                            text: '/mm',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Transform.translate(
                              offset: const Offset(0, 2),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 6,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Text(
                      widget.unitText,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: AppColors.gray,
                      ),
                    ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: textEditingController,
              builder: (context, textEditingValue, child) => ElevatedButton(
                onPressed: textEditingValue.text.isEmpty ||
                        double.tryParse(textEditingValue.text) == null
                    ? null
                    : () async {
                        final navigator = Navigator.of(context);
                        final value = double.parse(textEditingValue.text);
                        // ignore: unawaited_futures
                        showDialog<void>(
                          context: context,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        );

                        await widget.onSaved.call(value);

                        navigator.pop<void>();
                        return navigator.pop<void>();
                      },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('확인'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpsertTextExaminationResultDialog extends StatefulWidget {
  const UpsertTextExaminationResultDialog({
    super.key,
    required this.text,
    required this.onSaved,
  });

  final String text;
  final Future<void> Function(String) onSaved;

  @override
  State<UpsertTextExaminationResultDialog> createState() =>
      _UpsertTextExaminationResultDialogState();
}

class _UpsertTextExaminationResultDialogState
    extends State<UpsertTextExaminationResultDialog> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
            ),
            const SizedBox(height: 12),
            Text(
              '초음파/CT 소견을 작성해 주세요.',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.gray,
              ).rixMGoB,
            ),
            const SizedBox(height: 24),
            Container(
              height: 110,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGray,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ).rixMGoB,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: textEditingController,
              builder: (context, textEditingValue, child) => ElevatedButton(
                onPressed: textEditingValue.text.trim().isEmpty
                    ? null
                    : () async {
                        final navigator = Navigator.of(context);
                        // ignore: unawaited_futures
                        showDialog<void>(
                          context: context,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        );

                        await widget.onSaved.call(textEditingValue.text);

                        navigator.pop<void>();
                        return navigator.pop<void>();
                      },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('확인'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
