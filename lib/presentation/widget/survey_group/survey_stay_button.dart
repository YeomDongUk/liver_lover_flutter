// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';

class SurveyStateButton extends StatelessWidget {
  const SurveyStateButton({
    super.key,
    this.onTap,
    required this.surveyName,
    required this.done,
    required this.isBetweenSurveyDateTime,
    required this.isOverdue,
  });

  final void Function()? onTap;
  final String surveyName;
  final bool done;
  final bool isOverdue;
  final bool isBetweenSurveyDateTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(6),
      ),
      onTap: isBetweenSurveyDateTime || done ? onTap : null,
      child: Padding(
        padding: EdgeInsets.only(
          top: 24,
          bottom: isBetweenSurveyDateTime ? 15 : 24,
        ),
        child: Column(
          children: [
            Text(
              surveyName,
              style: TextStyle(
                fontSize: 17,
                color: done || isOverdue || isBetweenSurveyDateTime
                    ? Theme.of(context).primaryColor
                    : AppColors.gray,
              ).rixMGoEB,
            ),
            if (isBetweenSurveyDateTime || done || isOverdue) ...[
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/svg/check.svg',
                color: done
                    ? AppColors.green
                    : isOverdue
                        ? AppColors.magenta
                        : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
