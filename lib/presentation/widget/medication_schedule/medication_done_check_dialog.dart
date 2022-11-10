// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class MedicationDoneCheckDialog extends StatelessWidget {
  const MedicationDoneCheckDialog({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      hideCloseButton: true,
      child: SizedBox(
        height: 226,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '복약확인',
              style: const TextStyle(
                fontSize: 17,
                color: AppColors.primary,
              ).rixMGoEB,
            ),
            const SizedBox(height: 12),
            Text(
              '선택하신 약제를 정상적으로 복약을 하셨습니까?',
              style: const TextStyle(
                color: AppColors.gray,
                fontSize: 13,
              ).rixMGoB,
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        '아니오',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ).rixMGoEB,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onTap();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        '네',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ).rixMGoEB,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
