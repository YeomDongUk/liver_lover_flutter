// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:yak/domain/usecases/pill/search_pills.dart';
import 'package:yak/presentation/bloc/pill/search/pill_search_cubit.dart';

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
    return Dialog(
      child: BlocBuilder<PillSearchCubit, PillSearchState>(
        bloc: pillSearchCubit,
        builder: (context, state) => ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.pills.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) return const Center(child: Text('복용할 약을 선택해주세요'));
            if (index == state.pills.length + 1) {
              return Center(
                child: TextButton(
                  onPressed: this.index == null
                      ? null
                      : () => Navigator.of(context)
                          .pop(state.pills.elementAt(this.index!)),
                  child: const Text('확인'),
                ),
              );
            }

            final pill = state.pills.elementAt(index - 1);

            return ListTile(
              onTap: () => this.index == index - 1
                  ? setState(() => this.index = null)
                  : setState(() => this.index = index - 1),
              leading: IgnorePointer(
                child: Checkbox(
                  onChanged: (value) => null,
                  value: this.index == index - 1,
                ),
              ),
              title: Text(
                pill.name,
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            thickness: 1,
          ),
        ),
      ),
    );
  }
}
