import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/presentation/bloc/metabolic_disease/upsert/upsert_metabolic_disease_cubit.dart';

class FattyRivierUpdateForm extends StatelessWidget {
  const FattyRivierUpdateForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpsertMetabolicDiseaseCubit>();

    return BlocBuilder<UpsertMetabolicDiseaseCubit,
        UpsertMetabolicDiseaseState>(
      builder: (context, state) => DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [BoxShadow(color: Color(0x7ecdced2), blurRadius: 20)],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Text(
                '지방간',
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
                    InkWell(
                      onTap: () => cubit.updateFattyRiver(true),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightGray,
                          ),
                        ),
                        child: AnimatedOpacity(
                          opacity: (state.metabolicDisease.fattyRiver == true)
                              ? 1
                              : 0,
                          duration: const Duration(
                            milliseconds: 100,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/join_check.svg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '예',
                      style: const TextStyle(
                        fontSize: 15,
                      ).rixMGoB,
                    ),
                    const SizedBox(width: 24),
                    InkWell(
                      onTap: () => cubit.updateFattyRiver(false),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightGray,
                          ),
                        ),
                        child: AnimatedOpacity(
                          opacity: (state.metabolicDisease.fattyRiver == false)
                              ? 1
                              : 0,
                          duration: const Duration(milliseconds: 100),
                          child: SvgPicture.asset(
                            'assets/svg/join_check.svg',
                          ),
                        ),
                      ),
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
      ),
    );
  }
}
