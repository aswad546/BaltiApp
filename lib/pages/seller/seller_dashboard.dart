import 'dart:ui';

import 'package:balti_app/pages/seller/business_list.dart';
import 'package:balti_app/pages/seller/feedback.dart';
import 'package:balti_app/pages/seller/order_list.dart';
import 'package:balti_app/pages/user/user_dash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_icon_button.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({Key? key, required this.userId}) : super(key: key);

  final String userId;
  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: mediaQuery.size.width * 0.032),
              child: IconButton(
                icon: const Icon(Icons.swap_horiz),
                color: Colors.black,
                iconSize: mediaQuery.size.width * 0.08,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserDashScreen()),
                  );
                },
              ),
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.all(mediaQuery.size.width * 0.06),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Dashboard",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: mediaQuery.size.height * 0.056,
                fontFamily: "Poppins"),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.05,
          ),
          GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            crossAxisSpacing: mediaQuery.size.height * 0.07,
            mainAxisSpacing: mediaQuery.size.height * 0.07,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BusinessList(
                              userId: widget.userId,
                            )),
                  );
                },
                backgroundColor: const Color.fromARGB(193, 27, 209, 161),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaQuery.size.width * 0.032)),
                child: Icon(
                  Icons.add_business_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.15,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderList(userId: widget.userId)),
                  );
                },
                backgroundColor: const Color.fromARGB(193, 27, 209, 161),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaQuery.size.width * 0.032)),
                child: Icon(
                  Icons.event_note_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.15,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const SecondRoute()),
                  // );
                },
                backgroundColor: const Color.fromARGB(193, 27, 209, 161),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaQuery.size.width * 0.032)),
                child: Icon(
                  Icons.auto_graph_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.15,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedBack(userId: widget.userId)),
                  );
                },
                backgroundColor: const Color.fromARGB(193, 27, 209, 161),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(mediaQuery.size.width * 0.032)),
                child: Icon(
                  Icons.feedback_outlined,
                  color: Colors.black,
                  size: mediaQuery.size.width * 0.15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.06,
          ),
          // Center(
          //   child: ElevatedButton(
          //     // style: ButtonStyle(
          //     //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          //     //   fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(300)),
          //     // ),
          //     style: ElevatedButton.styleFrom(
          //       primary: const Color(0xffD11B26),
          //       minimumSize: const Size.fromHeight(
          //           40), // fromHeight use double.infinity as width and 40 is the height
          //     ),
          //     child: const Text("Logout"),
          //     onPressed: () {},
          //   ),
          // )
          CustomIconButton(
            color: const Color(0xffD11B26),
            buttonLabel: "Log out",
            onPressHandler: () {},
          ),
        ]),
      ),
    );
  }
}
