import 'package:flutter/material.dart';

class HeaderTabMenu extends StatelessWidget {
  final String text;
  final Color activeColor;
  final int count;

  const HeaderTabMenu({
    super.key,
    required this.text,
    required this.activeColor,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: activeColor,
            )),
        Container(
          margin: const EdgeInsets.only(left: 6.0),
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: activeColor,
          ),
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
