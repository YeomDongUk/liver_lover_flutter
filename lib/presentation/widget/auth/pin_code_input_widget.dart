// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';

class PinCodeInputWidget extends StatelessWidget {
  const PinCodeInputWidget({
    super.key,
    required this.visible,
    required this.pinCode,
  });
  final bool visible;
  final String pinCode;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        11,
        (index) {
          if (index.isOdd) {
            return const Spacer();
          }
          final i = index ~/ 2;
          final pin = pinCode;
          final exist = pin.length - 1 >= i;

          return Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: exist
                  ? Theme.of(context).primaryColor
                  : AppColors.blueGrayLight,
            ),
            alignment: Alignment.center,
            // child: Text(exist ? pin[i] : ''),
          );
        },
      ),
    );
  }
}
