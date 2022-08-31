// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/pill/pill.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class PillDetailDialog extends StatefulWidget {
  const PillDetailDialog({super.key, required this.pill});
  final Pill pill;

  @override
  State<PillDetailDialog> createState() => _PillDetailDialogState();
}

class _PillDetailDialogState extends State<PillDetailDialog> {
  late final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height < 611
              ? MediaQuery.of(context).size.height - 150
              : 611,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.pill.image != null)
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(6)),
                child: Image.memory(
                  widget.pill.image!,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.pill.name,
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).primaryColor,
                      ).rixMGoEB,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.pill.entpName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.gray,
                    ).rixMGoB,
                  ),
                ],
              ),
            ),
            const Divider(),
            if (widget.pill.material != null ||
                widget.pill.effect != null ||
                widget.pill.useage != null)
              Expanded(
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(24),
                    children: [
                      if (widget.pill.material != null) ...[
                        Text(
                          '원료약품 및 분량',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          widget.pill.material!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.blueGrayDark,
                            height: 1.4,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (widget.pill.effect != null) ...[
                        Text(
                          '효능효과',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          widget.pill.effect!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.blueGrayDark,
                            height: 1.4,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (widget.pill.useage != null) ...[
                        Text(
                          '용법용량',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          widget.pill.useage!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.blueGrayDark,
                            height: 1.4,
                          ).rixMGoB,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
