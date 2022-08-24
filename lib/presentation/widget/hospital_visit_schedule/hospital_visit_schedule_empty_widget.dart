// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/icon.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/widget/home/home_screen/home_container.dart';

class HospitalVisitScheduleEmptyWidget extends StatelessWidget {
  const HospitalVisitScheduleEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: Center(
        child: HomeContainer(
          boxColor: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 88,
          child: Material(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () =>
                  context.beamToNamed(Routes.hospitalVisitScheduleCreate),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    const Icon(
                      IconDatas.hospitalVisit,
                      size: 40,
                      color: AppColors.blueGrayLight,
                    ),
                    const SizedBox(width: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '등록된 예약 일정이 없습니다.',
                          style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.magenta,
                          ).rixMGoB,
                        ),
                        const SizedBox(height: 7),
                        Text(
                          '지금 일정을 등록하세요',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.gray,
                          ).rixMGoB,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
