import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.restaurantName,
    required this.imagePath,
  }) : super(key: key);

  final String restaurantName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight / 4.53125,
            width: SizeConfig.screenWidth / 1.44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x00000000).withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                colorBlendMode: BlendMode.dstATop,
                color: Colors.white.withOpacity(0.9),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight / 7.25,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight / 181.25,
                horizontal: SizeConfig.screenWidth / 60,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFFFFEFE),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  restaurantName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
