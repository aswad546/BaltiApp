import 'package:balti_app/pages/seller/order_approval.dart';
import 'package:balti_app/pages/seller/order_completed.dart';
import 'package:balti_app/pages/seller/order_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../utils/size_config.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key, required this.userId}) : super(key: key);

  final String userId;
  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      // context.watch<BusinessesList>().getBusinesses(phoneNumber);
      // Provider.of<UserCart>(context, listen: false).getProducts();
    }

    @override
    void dispose() {
      super.dispose();
    }

    Widget orderTypeCard(
        mediaQuery, title, quantity, price, unreadNotifier, route) {
      return GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          )
        },
        child: Card(
          margin: EdgeInsets.only(
              top: mediaQuery.size.height * 0.01,
              right: mediaQuery.size.width * 0.03),
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
                  child: Row(
                    children: [
                      Text('${title}',
                          style: TextStyle(
                              letterSpacing: 0.08,
                              fontSize: mediaQuery.size.width * 0.05,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 10,
                      ),
                      unreadNotifier
                          ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'NEW',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                quantity <= 1
                    ? Text('${quantity} item',
                        style: TextStyle(
                          letterSpacing: 0.08,
                          fontSize: mediaQuery.size.width * 0.04,
                        ))
                    : Text('${quantity} items',
                        style: TextStyle(
                          letterSpacing: 0.08,
                          fontSize: mediaQuery.size.width * 0.04,
                        )),
                Container(
                  width: mediaQuery.size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Show Details"),
                      Icon(Icons.chevron_right_sharp)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
                "Orders",
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
                // height: mediaQuery.size.height * 0.43,
                alignment: Alignment.topLeft,
                child: Expanded(
                  child: Column(
                    children: [
                      orderTypeCard(
                          mediaQuery,
                          'Orders in Progress',
                          10,
                          '1234',
                          true,
                          OrdersInProgress(
                            userId: widget.userId,
                          )),
                      orderTypeCard(
                          mediaQuery,
                          'Orders Completed',
                          15,
                          '1234',
                          false,
                          OrderCompleted(
                            userId: widget.userId,
                          )),
                      orderTypeCard(
                          mediaQuery,
                          'Approval',
                          2,
                          '1234',
                          true,
                          OrderApproval(
                            userId: widget.userId,
                          )),
                      orderTypeCard(mediaQuery, 'Scheduled Orders', 4, '1234',
                          true, null),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
