import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.buttonLabel,
    this.icon,
    this.width = 0.668,
    required this.color,
    required this.onPressHandler,
  }) : super(key: key);

  final String buttonLabel;
  final IconData? icon;
  final double? width;
  final Color color;
  final Function onPressHandler;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minWidth: double.infinity,
      height: 44,
      onPressed: () => onPressHandler(),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.only(left: mediaQuery.size.width / 18),
            width: mediaQuery.size.width * width!,
            child: Center(
              child: Text(
                buttonLabel,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ),
          icon != null
              ? Icon(
                  icon,
                  color: Colors.white,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
