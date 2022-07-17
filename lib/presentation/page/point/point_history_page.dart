import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yak/core/router/routes.dart';
import 'package:yak/core/static/color.dart';
import 'package:yak/presentation/widget/common/common_app_bar.dart';
import 'package:yak/presentation/widget/common/common_shadow_box.dart';
import 'package:yak/presentation/widget/common/icon_back_button.dart';

class PointHistoryPage extends StatefulWidget {
  const PointHistoryPage({super.key});

  @override
  State<PointHistoryPage> createState() => _PointHistoryPageState();
}

class _PointHistoryPageState extends State<PointHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        leading: const IconBackButton(),
        title: const Text('포인트'),
        actions: [
          IconButton(
            onPressed: () => context.beamToNamed(Routes.pointInformation),
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CommonShadowBox(
          margin: const EdgeInsets.all(24),
          child: ListView.separated(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) => index == 0
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: SvgPicture.asset(
                                    'assets/svg/icon_bronze.svg',
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'Diamond',
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: AppColors.gray,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '295',
                                style: GoogleFonts.lato(
                                  fontSize: 50,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text: 'P',
                                style: GoogleFonts.lato(
                                  fontSize: 50,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
