import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yak/core/static/text_style.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '만성간염관리',
                style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).primaryColor,
                ).rixMGoB,
              ),
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/svg/symbol.svg',
                width: 147,
                height: 162,
              ),
              const SizedBox(height: 140),
              InkWell(
                onTap: () => context.beamToNamed('login'),
                child: Padding(
                  padding: const EdgeInsets.all(10.5),
                  child: Text(
                    '등록된 사용자입니다.',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ).rixMGoB,
                  ),
                ),
              ),
              InkWell(
                onTap: () => context.beamToNamed('join'),
                child: Padding(
                  padding: const EdgeInsets.all(10.5),
                  child: Text(
                    '처음 사용자입니다.',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ).rixMGoB,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
