import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.title,
    required this.onTapHandler,
  }) : super(key: key);

  final String title;
  final Function() onTapHandler;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        height: SizeConfig.screenHeight / 12.0833,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000).withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenWidth / 9),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
