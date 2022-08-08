import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../providers/location_provider.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_icon_button.dart';
import 'map_screen.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffffffff),
          leading: Padding(
            padding: EdgeInsets.only(left: mediaQuery.size.width * 0.032),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              iconSize: mediaQuery.size.width * 0.08,
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: mediaQuery.size.width * 0.032),
              child: IconButton(
                icon: const Icon(Icons.swap_horiz),
                color: Colors.black,
                iconSize: mediaQuery.size.width * 0.08,
                onPressed: () {},
              ),
            ),
          ]),
      body: Padding(
          padding: EdgeInsets.only(
              left: mediaQuery.size.width * 0.06,
              right: mediaQuery.size.width * 0.06),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "About Us",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: mediaQuery.size.height * 0.056,
                  fontFamily: "Poppins"),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.008,
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.50),
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // type: BottomNavigation
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
    ;
  }
}
