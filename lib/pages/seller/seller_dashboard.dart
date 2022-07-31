import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({Key? key}) : super(key: key);

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffffffff),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.swap_horiz),
                color: Colors.black,
                iconSize: 30,
                onPressed: () {},
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Dashboard",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 40,
                fontFamily: "Poppins"),
          ),
          const SizedBox(
            height: 30,
          ),
          GridView.count(
            shrinkWrap: true,
            primary: true,
            crossAxisCount: 2,
            crossAxisSpacing: 50.0,
            mainAxisSpacing: 50.0,
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
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.add_business_outlined,
                  color: Colors.black,
                  size: 60,
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
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.event_note_outlined,
                  color: Colors.black,
                  size: 60,
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
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.auto_graph_outlined,
                  color: Colors.black,
                  size: 60,
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
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.feedback_outlined,
                  color: Colors.black,
                  size: 60,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              //   fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(300)),
              // ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffD11B26),
                minimumSize: const Size.fromHeight(
                    40), // fromHeight use double.infinity as width and 40 is the height
              ),
              child: const Text("Logout"),
              onPressed: () {},
            ),
          )
        ]),
      ),
    );
  }
}
