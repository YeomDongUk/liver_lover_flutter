// Flutter imports:
import 'dart:async';

import 'package:flutter/material.dart';

// Package imports:
import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/core/database/database.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/usecases/pill/create_pill.dart';
import 'package:yak/domain/usecases/pill/search_pills.dart';
import 'package:yak/presentation/bloc/pill/search/pill_search_cubit.dart';
import 'package:yak/presentation/widget/common/common_dialog.dart';

class PillSearchDialog extends StatefulWidget {
  const PillSearchDialog({super.key, required this.pillName});
  final String pillName;

  @override
  State<PillSearchDialog> createState() => _PillSearchDialogState();
}

class _PillSearchDialogState extends State<PillSearchDialog> {
  late final PillSearchCubit pillSearchCubit;
  int? index;
  @override
  void initState() {
    pillSearchCubit = PillSearchCubit(
      searchPills: KiwiContainer().resolve<SearchPills>(),
    )..search(widget.pillName);
    super.initState();
  }

  @override
  void dispose() {
    pillSearchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: BlocBuilder<PillSearchCubit, PillSearchState>(
        bloc: pillSearchCubit,
        builder: (context, state) => state.status ==
                FormzStatus.submissionInProgress
            ? Container(
                alignment: Alignment.center,
                height: 100,
                child: const CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      '약제선택',
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
                      itemCount: state.pills.length,
                      itemBuilder: (context, index) {
                        final pill = state.pills.elementAt(index);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          pill.name,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: AppColors.primary,
                                          ).rixMGoEB,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          pill.entpName,
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
                              final pill = state.pills.elementAt(index!);

                              unawaited(
                                showDialog<void>(
                                  context: context,
                                  builder: (_) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  barrierDismissible: false,
                                ),
                              );

                              await KiwiContainer().resolve<CreatePill>().call(
                                    PillsCompanion.insert(
                                      id: drift.Value(pill.id),
                                      entpName: pill.entpName,
                                      name: pill.name,
                                    ),
                                  );

                              if (mounted) {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop(pill);
                              }
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
      ),
    );
  }
}
