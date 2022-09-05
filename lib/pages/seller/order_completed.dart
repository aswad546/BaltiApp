import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../utils/size_config.dart';
import '../../widgets/custom_icon_button.dart';

class OrderCompleted extends StatefulWidget {
  const OrderCompleted({Key? key, required this.userId}) : super(key: key);

  final String userId;
  @override
  State<OrderCompleted> createState() => _OrderCompletedState();
}

class _OrderCompletedState extends State<OrderCompleted> {
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

    Widget orderDetailsCard(mediaQuery, name, address, quantity, price, date) {
      return Card(
        margin: EdgeInsets.only(
            top: mediaQuery.size.height * 0.01,
            right: mediaQuery.size.width * 0.03),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: mediaQuery.size.height * 0.01),
                    child: Text('${name}\'s Order',
                        style: TextStyle(
                            letterSpacing: 0.08,
                            fontSize: mediaQuery.size.width * 0.05,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${date}',
                      style: TextStyle(
                          letterSpacing: 0.08,
                          fontSize: mediaQuery.size.width * 0.045,
                          fontWeight: FontWeight.w800)),
                  Text('${address}',
                      style: TextStyle(
                          letterSpacing: 0.08,
                          fontSize: mediaQuery.size.width * 0.04,
                          fontWeight: FontWeight.w300)),
                  quantity <= 1
                      ? Text('${quantity} item',
                          style: TextStyle(
                            letterSpacing: 0.08,
                            fontSize: mediaQuery.size.width * 0.035,
                          ))
                      : Text('${quantity} items',
                          style: TextStyle(
                            letterSpacing: 0.08,
                            fontSize: mediaQuery.size.width * 0.035,
                          )),
                ],
              ),
              Align(
                child: Container(
                  child: Text(
                    'Rs. $price',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F9469),
                        fontSize: 17),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    ;

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
                "Orders Completed",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: mediaQuery.size.height * 0.040,
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
                      orderDetailsCard(mediaQuery, 'Hammad', 'Bahria Town', 10,
                          1234, '11-11-1111'),
                      orderDetailsCard(mediaQuery, 'Ali', 'Wapda Town', 1, 2211,
                          '11-11-1111'),
                      orderDetailsCard(mediaQuery, 'Usman', 'DHA Phase 1', 2,
                          1234, '11-11-1111')
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
