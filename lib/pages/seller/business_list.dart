import 'dart:ui';

import 'package:balti_app/pages/seller/add_business.dart';
import 'package:balti_app/pages/seller/edit_business.dart';
import 'package:balti_app/pages/seller/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/business.dart';
import '../../providers/business_provider.dart';

class BusinessList extends StatefulWidget {
  const BusinessList({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<BusinessList> createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  late Future<void> getBusinesses;
  late String phoneNumber = "";
  @override
  void initState() {
    super.initState();
    // context.watch<BusinessesList>().getBusinesses(phoneNumber);
    getBusinesses = Provider.of<Businesses>(context, listen: false)
        .findByUserId(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    // print("*************************");
    // print(context.watch<BusinessesList>().business);
    // print(context.watch<BusinessesList>().business.isEmpty);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
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
            bottom: mediaQuery.size.width * 0.05,
            right: mediaQuery.size.width * 0.06,
            left: mediaQuery.size.width * 0.06,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Businesses",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: mediaQuery.size.height * 0.056,
                      fontFamily: "Poppins"),
                ),
                FutureBuilder(
                  future: getBusinesses,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Expanded(
                          child: context.watch<Businesses>().businesses.isEmpty
                              ? Center(
                                  child: Text(
                                  "No Businesses, Click Add to Get Started",
                                  style: TextStyle(
                                      fontSize: mediaQuery.size.width * 0.05,
                                      color: Colors.black),
                                ))
                              : ListView(
                                  children: context
                                      .watch<Businesses>()
                                      .businesses
                                      .map((data) => GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductList(
                                                          userId: widget.userId,
                                                          businessId: data.id,
                                                        )),
                                              );
                                            },
                                            child: Card(
                                              margin: EdgeInsets.only(
                                                  top: mediaQuery.size.height *
                                                      0.03,
                                                  left: mediaQuery.size.width *
                                                      0.02,
                                                  right: mediaQuery.size.width *
                                                      0.02),
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(children: [
                                                Container(
                                                    width:
                                                        mediaQuery.size.width *
                                                            0.16,
                                                    height:
                                                        mediaQuery.size.height *
                                                            0.09,
                                                    margin: EdgeInsets.all(
                                                        mediaQuery.size.width *
                                                            0.025),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          data.imageUrl
                                                              .toString(),
                                                          // width: mediaQuery.size.width * 0.2,
                                                          // height: mediaQuery.size.height * 0.1,
                                                          fit: BoxFit.cover,
                                                        ))),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(data.name.toString(),
                                                        style: TextStyle(
                                                            letterSpacing: 0.08,
                                                            fontSize: mediaQuery
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    Text("_ Products",
                                                        style: TextStyle(
                                                            letterSpacing: 0.08,
                                                            fontSize: mediaQuery
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Container(),
                                                ),
                                                FloatingActionButton(
                                                  onPressed: () => {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditBusiness(
                                                                business: data,
                                                              )),
                                                    )
                                                  },
                                                  elevation: 0,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.black,
                                                    size:
                                                        mediaQuery.size.width *
                                                            0.055,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: mediaQuery.size.width *
                                                      0.01,
                                                )
                                              ]),
                                            ),
                                          ))
                                      .toList(),
                                ));
                    }
                    else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ])),
      floatingActionButton: Container(
        width: mediaQuery.size.width * 0.155,
        height: mediaQuery.size.height * 0.125,
        child: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddBusiness(
                        userId: widget.userId,
                      )),
            )
          },
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
