import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../search_bar.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(120),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      toolbarHeight: 120,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {}, // Open Google map selection Screen
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
                'Agrics Town, Lahore',
                style: textTheme.headline3,
              ),
            ],
          ),
        ),
      ), // Replace with result of Google Location Api
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
