import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../providers/location_provider.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_icon_button.dart';
import 'map_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> images = [
    'assets/images/burger.jpg',
    'assets/images/roll.jpg',
    'assets/images/tacos.jpg',
  ];
  @override
  void dispose() {
    super.dispose();
  }

  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80,
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
              } else {
                Navigator.of(context).pushNamed(
                  MapScreen.routeName,
                  arguments: {
                    "latitude": 30.0,
                    "longitude": 69.0,
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
                          ? 'Select Location'
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Replace with owl carousel
              CarouselSlider(
                items: images
                    .map(
                      (imagePath) => Container(
                        margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight / 36.25,
                        ),
                        width: double.infinity,
                        height: SizeConfig.screenHeight / 3.625,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                              imagePath,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth / 24,
                ),
                child: const Text(
                  "Burger And Fries",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth / 24,
                  vertical: SizeConfig.screenHeight / 145,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PKR 599",
                      style: TextStyle(
                        color: Color.fromARGB(255, 47, 148, 104),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        ClipOval(
                          child: Material(
                            color: const Color.fromRGBO(
                              27,
                              209,
                              161,
                              0.85,
                            ), // Button color
                            child: InkWell(
                              splashColor: const Color.fromARGB(
                                  255, 47, 148, 104), // Splash color
                              onTap: () {
                                if (itemCount != 0) {
                                  setState(() => itemCount -= 1);
                                }
                              },
                              child: SizedBox(
                                width: SizeConfig.screenWidth / 9,
                                height: SizeConfig.screenWidth / 9,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: SizeConfig.screenWidth / 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth / 18,
                        ),
                        Text(
                          "$itemCount",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth / 18,
                        ),
                        ClipOval(
                          child: Material(
                            color: const Color.fromRGBO(
                              27,
                              209,
                              161,
                              0.85,
                            ), // Button color
                            child: InkWell(
                              splashColor: const Color.fromARGB(
                                  255, 47, 148, 104), // Splash color
                              onTap: () {
                                setState(() => itemCount += 1);
                              },
                              child: SizedBox(
                                width: SizeConfig.screenWidth / 9,
                                height: SizeConfig.screenWidth / 9,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: SizeConfig.screenWidth / 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth / 24,
                  vertical: SizeConfig.screenHeight / 72.5,
                ),
                child: const Text(
                  "This is a very juicy burger with fries and yummy dips",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 5.179,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth / 18),
                child: CustomIconButton(
                  color: const Color.fromARGB(193, 27, 209, 161),
                  buttonLabel: "Add to Cart",
                  onPressHandler: () async {},
                ),
              ),
            ],
          ),
        ),
      ),
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
