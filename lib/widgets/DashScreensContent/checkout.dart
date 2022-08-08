import 'package:balti_app/providers/location_provider.dart';
import 'package:balti_app/widgets/AppBars/user_app_bar.dart';
import 'package:balti_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../../widgets/product_card.dart';
import '../../../widgets/restaurant_cart.dart';
import '../../models/business.dart';
import '../../models/product.dart';
import '../../pages/user/map_screen.dart';
import '../../providers/business_provider.dart';
import '../../providers/product_provider.dart';
import '../../utils/size_config.dart';
import '../custom_icon_button.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await Provider.of<Location>(context, listen: false).setLocation();
        if (mounted) {
          await Provider.of<Products>(context, listen: false)
              .fetchAndSetProducts();
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double lat = Provider.of<Location>(context).latitude;
    double lng = Provider.of<Location>(context).longitude;
    List<Product> products = Provider.of<Products>(
      context,
    ).products;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Checkout",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: mediaQuery.size.height * 0.056,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.008,
          ),
          GestureDetector(
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
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        lat == -1 && lng == -1
                            ? 'Finding you'
                            : Provider.of<Location>(context, listen: false)
                                .currentAddress,
                        // "ver very very very veyr veyr veyr long text",
                        style: textTheme.headline3,
                      ),
                    ),
                  ),
                  SizedBox(width: mediaQuery.size.width * 0.05),
                  MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // minWidth: mediaQuery.size.width*0.1,
                    height: mediaQuery.size.height * 0.04,
                    onPressed: () => {
                      if (lat != -1 && lng != -1)
                        {
                          Navigator.of(context).pushNamed(
                            MapScreen.routeName,
                            arguments: {"latitude": lat, "longitude": lng},
                          )
                        }
                    },
                    color: Color.fromRGBO(27, 209, 161, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(
                      child: Text(
                        "Change",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          Text(
            "Payment Method",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: mediaQuery.size.height * 0.025,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.008,
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(27, 209, 161, 1)),
              fixedSize: MaterialStateProperty.all(Size(
                  mediaQuery.size.height * 0.04, mediaQuery.size.height * 0.07)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              padding: MaterialStateProperty.all(EdgeInsets.all(mediaQuery.size.width*0.005))
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.attach_money,
                    size: mediaQuery.size.height * 0.045,
                  ),
                  Text(
                    "Cash",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: mediaQuery.size.height * 0.013,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          Text(
            "Summary",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: mediaQuery.size.height * 0.025,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.008,
          ),
          Expanded(
              child: products.isEmpty
                  ? Center(
                      child: Text(
                      "No Products",
                      style: TextStyle(
                          fontSize: mediaQuery.size.width * 0.05,
                          color: Colors.black),
                    ))
                  : ListView(
                      children: products
                          .map((data) => Card(
                                margin: EdgeInsets.only(
                                  top: mediaQuery.size.height * 0.013 / 2,
                                  left: mediaQuery.size.width * 0.01,
                                  right: mediaQuery.size.width * 0.01,
                                  bottom: mediaQuery.size.height * 0.013 / 2,
                                ),
                                elevation: 7.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: GestureDetector(
                                  onTap: () => {},
                                  child: Row(children: [
                                    Container(
                                        width: mediaQuery.size.height * 0.066,
                                        height: mediaQuery.size.height * 0.066,
                                        margin: EdgeInsets.all(
                                            mediaQuery.size.width * 0.012),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              data.imageUrl,
                                              // width: mediaQuery.size.width * 0.2,
                                              // height: mediaQuery.size.height * 0.1,
                                              fit: BoxFit.cover,
                                            ))),
                                    SizedBox(
                                      width: mediaQuery.size.width * 0.01,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(data.name,
                                              style: TextStyle(
                                                  letterSpacing: 0.08,
                                                  fontSize:
                                                      mediaQuery.size.width *
                                                          0.035,
                                                  fontWeight: FontWeight.w500)),
                                          Text("Business #${data.businessId}",
                                              style: TextStyle(
                                                  letterSpacing: 0.08,
                                                  fontSize:
                                                      mediaQuery.size.width *
                                                          0.025,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: mediaQuery.size.width * 0.01),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("PKR ${data.price}",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff2F9469),
                                                  letterSpacing: 0.08,
                                                  fontSize:
                                                      mediaQuery.size.width *
                                                          0.03,
                                                  fontWeight: FontWeight.bold)),
                                          Text("quantity",
                                              style: TextStyle(
                                                  letterSpacing: 0.08,
                                                  fontSize:
                                                      mediaQuery.size.width *
                                                          0.03,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ))
                          .toList(),
                    )),
          Card(
            margin: EdgeInsets.only(
              top: mediaQuery.size.height * 0.013,
            ),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.black,width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Subtotal",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.035,
                              fontWeight: FontWeight.w500)),
                      Text("Tax and Fees",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.035,
                              fontWeight: FontWeight.w500)),
                      Text("Delivery",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.035,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Text("Total",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.042,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: mediaQuery.size.width * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("PKR 0000",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.035,
                              fontWeight: FontWeight.w500)),
                      Text("PKR 000",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.035,
                              fontWeight: FontWeight.w500)),
                      Text("Free",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.035,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: mediaQuery.size.height * 0.01,
                      ),
                      Text("Rs. 0000",
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.042,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.035,
          ),
          CustomIconButton(
            color: const Color.fromARGB(193, 27, 209, 161),
            icon: Icons.arrow_forward,
            buttonLabel: "PLace Order",
            onPressHandler: () async {},
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          )
        ]),
      ),
    );
  }
}
