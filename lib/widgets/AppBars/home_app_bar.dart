import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/user/map_screen.dart';
import '../../providers/location_provider.dart';
import '../../utils/size_config.dart';
import '../search_bar.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(120),
        super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
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
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      toolbarHeight: 120,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Consumer<Location>(builder: (context, location, child) {
        return GestureDetector(
          onTap: () {
            if (location.latitude != -1 && location.longitude != -1) {
              Navigator.of(context).pushNamed(
                MapScreen.routeName,
                arguments: {
                  "latitude": location.latitude,
                  "longitude": location.longitude
                },
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
                SizedBox(
                  width: SizeConfig.screenWidth / 1.8,
                  child: Text(
                    location.latitude == -1 && location.longitude == -1
                        ? 'Finding you'
                        : location.currentAddress,
                    style: textTheme.headline3,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        );
      }), // Replace with result of Google Location Api
      bottom: const PreferredSize(
        preferredSize: Size.zero,
        child: SearchBar(),
      ),
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
    );
  }
}
