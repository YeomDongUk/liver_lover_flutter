// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:yak/core/static/text_style.dart';

class KeyPadWidget extends StatelessWidget {
  const KeyPadWidget({
    super.key,
    required this.onTapNumber,
  });

  final void Function(String numberString) onTapNumber;

  @override
  Widget build(BuildContext context) {
    const numberStrings = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '취소',
      '0',
      'delete'
    ];

    return Column(
      children: List.generate(
        4,
        (y) => Expanded(
          child: Row(
            children: List.generate(
              3,
              (x) {
                final numberString = numberStrings[y * 3 + x];
                return Expanded(
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => onTapNumber(numberString),
                    child: Center(
                      child: numberString == 'delete'
                          ? SvgPicture.asset('assets/svg/clear.svg')
                          : Text(
                              numberString,
                              style: numberString == '취소'
                                  ? const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ).rixMGoB
                                  : const TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                    ).airbnbM,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
