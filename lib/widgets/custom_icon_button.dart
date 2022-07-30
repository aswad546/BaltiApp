import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.buttonLabel,
    required this.icon,
    required this.color,
    required this.onPressHandler,
  }) : super(key: key);

  final String buttonLabel;
  final IconData icon;
  final Color color;
  final Function onPressHandler;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MaterialButton(
      minWidth: double.infinity,
      height: 44,
      onPressed: () => onPressHandler(),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: mediaQuery.size.width * 0.668,
            child: Center(
              child: Text(
                buttonLabel,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}