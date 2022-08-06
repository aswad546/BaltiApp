import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/settings_list_tile.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 24),
              child: const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 32.5,
            ),
            SettingsListTile(
              title: 'Orders History',
              onTapHandler: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 48.33,
            ),
            SettingsListTile(
              title: 'Privacy and Security',
              onTapHandler: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 48.33,
            ),
            SettingsListTile(
              title: 'Terms and Condition',
              onTapHandler: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 48.33,
            ),
            SettingsListTile(
              title: 'Contact Us',
              onTapHandler: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 48.33,
            ),
            SettingsListTile(
              title: 'About',
              onTapHandler: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 9.0625,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 45),
              child: CustomIconButton(
                color: const Color.fromARGB(195, 209, 27, 39),
                buttonLabel: "Logout",
                onPressHandler: () async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
