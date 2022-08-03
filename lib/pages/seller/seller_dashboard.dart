import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_icon_button.dart';
import '../../providers/auth_provider.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;
  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffffffff),
            leading: Padding(
              padding: EdgeInsets.only(left: mediaQuery.size.width * 0.032),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                iconSize: mediaQuery.size.width * 0.07,
                onPressed: () {},
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: mediaQuery.size.width * 0.032),
                child: IconButton(
                  icon: const Icon(Icons.swap_horiz),
                  color: Colors.black,
                  iconSize: mediaQuery.size.width * 0.07,
                  onPressed: () {},
                ),
              ),
            ]),
      ),
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
                  Icons.add_business_outlined,
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
            onPressHandler: () async {
              await Provider.of<Auth>(context, listen: false).logout(
                phoneNumber,
              );
            },
          ),
        ]),
      ),
    );
  }
}
