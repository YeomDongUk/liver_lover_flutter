import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kiwi/kiwi.dart';

import 'package:yak/domain/entities/metabolic_disease.dart';
import 'package:yak/domain/usecases/metabolic_disease/upsert_metabolic_disease.dart';
import 'package:yak/presentation/bloc/metabolic_disease/metabolic_disease_cubit.dart';
import 'package:yak/presentation/bloc/metabolic_disease/upsert/upsert_metabolic_disease_cubit.dart';
import 'package:yak/presentation/widget/metabolic_disease/fatty_rivier_update_form.dart';
import 'package:yak/presentation/widget/metabolic_disease/hav_update_form.dart';
import 'package:yak/presentation/widget/metabolic_disease/hbv_update_form.dart';
import 'package:yak/presentation/widget/metabolic_disease/hcv_update_form.dart';

class UpdateMetabolicDiseaseTabView extends StatefulWidget {
  const UpdateMetabolicDiseaseTabView({
    super.key,
  });

  @override
  State<UpdateMetabolicDiseaseTabView> createState() =>
      _UpdateMetabolicDiseaseTabViewState();
}

class _UpdateMetabolicDiseaseTabViewState
    extends State<UpdateMetabolicDiseaseTabView>
    with AutomaticKeepAliveClientMixin {
  late final List<FocusNode> focusNodes;
  late final UpsertMetabolicDiseaseCubit upsertMetabolicDiseaseCubit;

  @override
  void initState() {
    focusNodes = List.generate(6, (index) => FocusNode());
    upsertMetabolicDiseaseCubit = UpsertMetabolicDiseaseCubit(
      metabolicDisease:
          context.read<MetabolicDiseaseCubit>().state.metabolicDisease ??
              MetabolicDisease.undefined(),
      upsertMetabolicDisease: KiwiContainer().resolve<UpsertMetabolicDisease>(),
    );
    super.initState();
  }

  @override
  void dispose() {
    focusNodes.map((element) => element.dispose());
    upsertMetabolicDiseaseCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const children = [
      HBVUpdateForm(),
      HCVUpdateForm(),
      HAVUpdateForm(),
      FattyRivierUpdateForm(),
    ];
    return BlocProvider<UpsertMetabolicDiseaseCubit>.value(
      value: upsertMetabolicDiseaseCubit,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                shrinkWrap: true,
                itemCount: children.length,
                itemBuilder: (context, index) => children[index],
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                // children:
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
