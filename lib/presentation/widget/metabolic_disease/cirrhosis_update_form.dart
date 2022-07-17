import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/metabolic_disease/upsert/upsert_metabolic_disease_cubit.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/opacity_check_button.dart';

class CirrhosisUpdateForm extends StatelessWidget {
  const CirrhosisUpdateForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpsertMetabolicDiseaseCubit>();
    return BlocBuilder<UpsertMetabolicDiseaseCubit,
        UpsertMetabolicDiseaseState>(
      builder: (context, state) => CommonShadowBox(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Text(
              '간견병증',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ).rixMGoEB,
            ),
            const Spacer(),
            SizedBox(
              width: 159,
              child: Row(
                children: [
                  OpacityCheckButton(
                    onTap: () => cubit.updateCirrhosis(true),
                    opacity: (state.metabolicDisease.cirrhosis == true) ? 1 : 0,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '예',
                    style: const TextStyle(
                      fontSize: 15,
                    ).rixMGoB,
                  ),
                  const SizedBox(width: 24),
                  OpacityCheckButton(
                    onTap: () => cubit.updateCirrhosis(false),
                    opacity:
                        (state.metabolicDisease.cirrhosis == false) ? 1 : 0,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '아니오',
                    style: const TextStyle(
                      fontSize: 15,
                    ).rixMGoB,
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
