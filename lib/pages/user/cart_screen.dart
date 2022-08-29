import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../providers/cart_provider.dart';
import '../../utils/size_config.dart';
import '../../providers/location_provider.dart';
import '../../widgets/custom_icon_button.dart';
import 'map_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    // context.watch<BusinessesList>().getBusinesses(phoneNumber);
    Provider.of<UserCart>(context, listen: false).getProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // card widget function
    Widget newCard(mediaQuery, name, price, imageUrl, quantity) {
      return Card(
        margin: EdgeInsets.only(
            top: mediaQuery.size.height * 0.01,
            right: mediaQuery.size.width * 0.03),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Container(
              width: mediaQuery.size.width * 0.18,
              height: mediaQuery.size.height * 0.1,
              margin: EdgeInsets.all(mediaQuery.size.width * 0.025),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
                child: Text('$name',
                    style: TextStyle(
                        letterSpacing: 0.08,
                        fontSize: mediaQuery.size.width * 0.05,
                        fontWeight: FontWeight.w500)),
              ),
              Text("delicious and tasty product",
                  style: TextStyle(
                      letterSpacing: 0.08,
                      fontSize: mediaQuery.size.width * 0.03,
                      fontWeight: FontWeight.w400)),
              Container(
                width: mediaQuery.size.width * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          color: Color(0xFF1BD19F),
                          child: Icon(Icons.remove,
                              color: Colors.black, size: 20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$quantity'),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          color: Color(0xFF1BD19F),
                          child:
                              Icon(Icons.add, color: Colors.black, size: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  'Rs. $price',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F9469),
                      fontSize: 15),
                ),
              )
            ],
          ),
        ]),
      );
    }

    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    MediaQueryData mediaQuery = MediaQuery.of(context);

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
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              left: mediaQuery.size.width * 0.05,
              top: mediaQuery.size.width * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cart",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: mediaQuery.size.height * 0.050,
                    fontFamily: "Poppins"),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              Container(
                height: mediaQuery.size.height * 0.43,
                alignment: Alignment.topLeft,
                child: Expanded(
                    child: context.watch<UserCart>().cartProducts.isEmpty
                        ? Center(
                            child: Text(
                            "Shopping Cart Empty",
                            style: TextStyle(
                                fontSize: mediaQuery.size.width * 0.05,
                                color: Colors.black),
                          ))
                        : ListView(
                            children: context
                                .watch<UserCart>()
                                .cartProducts
                                .map((data) => newCard(mediaQuery, data.name,
                                    data.price, data.imageUrl, 1))
                                .toList(),
                          )),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -50,
          child: Container(
              height: mediaQuery.size.height * 0.35,
              width: mediaQuery.size.width,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 15.0, //extend the shadow
                      offset: Offset(
                        15.0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Rs.900',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax and Fees',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Rs.200',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'Rs.1100',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01,
                    ),
                    CustomIconButton(
                        color: const Color.fromARGB(193, 27, 209, 161),
                        icon: Icons.arrow_forward_rounded,
                        width: 0.5,
                        buttonLabel: "Checkout",
                        onPressHandler: () async {}),
                  ],
                ),
              )),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.50),
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // type: BottomNavigation
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        // currentIndex: _currentIndex,
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
  }
}
