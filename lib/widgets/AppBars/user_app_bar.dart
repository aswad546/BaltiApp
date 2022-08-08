import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/user/map_screen.dart';
import '../../providers/location_provider.dart';
import '../../utils/size_config.dart';
import '../search_bar.dart';

class UserAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  const UserAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(62),
        super(key: key);

  @override
  State<UserAppBar> createState() => _UserAppBarState();
}

class _UserAppBarState extends State<UserAppBar> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await Provider.of<Location>(context, listen: false).setLocation();
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double lat = Provider.of<Location>(context).latitude;
    double lng = Provider.of<Location>(context).longitude;
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return PreferredSize(
      preferredSize: Size(SizeConfig.screenWidth, SizeConfig.screenHeight*1),
      child: AppBar(
        toolbarHeight: SizeConfig.screenHeight*0.12,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            if (lat != -1 && lng != -1) {
              Navigator.of(context).pushNamed(
                MapScreen.routeName,
                arguments: {"latitude": lat, "longitude": lng},
              );
            }
          }, // Open Google map selection Screen
          child: Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth / 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.rotate(
                  alignment: Alignment.center,
                  angle: 30 * math.pi / 180,
                  child: const Icon(
                    Icons.navigation,
                    color: Color.fromRGBO(27, 209, 161, 1),
                  ),
                ),
                Text(
                  lat == -1 && lng == -1
                      ? 'Finding you'
                      : Provider.of<Location>(context, listen: false)
                          .currentAddress,
                  style: textTheme.headline3,
                ),
              ],
            ),
          ),
        ), // Replace with result of Google Location Api
        // bottom: const PreferredSize(
        //   preferredSize: Size.zero,
        //   child: SearchBar(),
        // ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.swap_horiz_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
