// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:drift/drift.dart' as drift;
import 'package:flutter_svg/svg.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/pill/create_pill.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class CommonPillSearchDialog extends StatefulWidget {
  const CommonPillSearchDialog({super.key});

  @override
  State<CommonPillSearchDialog> createState() => _CommonPillSearchDialogState();
}

class _CommonPillSearchDialogState extends State<CommonPillSearchDialog> {
  int? index;

  final pills = [
    PillsCompanion.insert(
      id: const drift.Value('201004172'),
      name: '비리어드',
      entpName: '길리어드사이언스코리아(유)',
    ),
    PillsCompanion.insert(
      id: const drift.Value('200605263'),
      name: '바라크루드',
      entpName: '(유)한국비엠에스제약',
    ),
    PillsCompanion.insert(
      id: const drift.Value('201702418'),
      name: '베믈리디',
      entpName: '길리어드사이언스코리아(유)',
    ),
    PillsCompanion.insert(
      id: const drift.Value('201800200'),
      name: '마비렛',
      entpName: '한국애브비(주)',
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(24),
            child: Text(
              '자주 사용하는 약제 선택',
              style: TextStyle(
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 340),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final pill = pills.elementAt(index);
                final isSelected = this.index == index;

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => this.index == index
                        ? setState(() => this.index = null)
                        : setState(() => this.index = index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/check.svg',
                            width: 30,
                            height: 31,
                            color: !isSelected
                                ? null
                                : Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  pill.name.value,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: AppColors.primary,
                                  ).rixMGoEB,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  pill.entpName.value,
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
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: index == null
                  ? null
                  : () async {
                      final pillCompanion = pills.elementAt(index!);

                      final either = await KiwiContainer()
                          .resolve<CreatePill>()
                          .call(pillCompanion);

                      either.fold(
                        (l) => l,
                        (pill) =>
                            !mounted ? null : Navigator.of(context).pop(pill),
                      );
                    },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                '확인',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ).rixMGoEB,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
