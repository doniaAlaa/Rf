import 'package:flutter/material.dart';

class PrimaryAppButton extends StatelessWidget {
  final String buttonTitle;
  final Function() onPress;
  const PrimaryAppButton(
      {super.key, required this.buttonTitle, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 60,
        child: DecoratedBox(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 91, 99, 220),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
              child: Text(
                buttonTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            )),
      ),
    );
  }
}
