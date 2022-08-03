import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffffffff),
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
          padding: EdgeInsets.only(
            bottom: mediaQuery.size.width * 0.05,
            right: mediaQuery.size.width * 0.06,
            left: mediaQuery.size.width * 0.06,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Products",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: mediaQuery.size.height * 0.056,
                  fontFamily: "Poppins"),
            ),
            GridView.count(
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 2,
              crossAxisSpacing: mediaQuery.size.height * 0.07,
              mainAxisSpacing: mediaQuery.size.height * 0.07,
              children: <Widget>[],
            ),
          ])),
      floatingActionButton: Container(
        width: mediaQuery.size.width * 0.155,
        height: mediaQuery.size.height * 0.125,
        child: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: Color.fromARGB(193, 27, 209, 161),
          child: Icon(
            Icons.add,
            size: mediaQuery.size.width * 0.1,
          ),
        ),
      ),
      
    );
  }
}
