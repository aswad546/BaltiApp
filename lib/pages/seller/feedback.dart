import 'package:balti_app/models/business.dart';
import 'package:balti_app/providers/feedback_provider.dart';
import 'package:balti_app/widgets/star_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../providers/business_provider.dart';
import '../../utils/size_config.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key, required this.userId}) : super(key: key);
  
  final String userId;

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      // context.watch<BusinessesList>().getBusinesses(phoneNumber);
      Provider.of<Businesses>(context, listen: false).findByUserId(widget.userId);
      Provider.of<FeedbackItems>(context, listen: false)
          .getFeedbackOfBusiness(Provider.of<Businesses>(
      context,
    ).businesses[0].id);
    }

    @override
    void dispose() {
      super.dispose();
    }

    Widget FeedbackItemCard(
        mediaQuery, businessId, userId, prodId, comment, rating) {
      return Card(
        margin: EdgeInsets.only(
            top: mediaQuery.size.height * 0.01,
            right: mediaQuery.size.width * 0.03),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${userId}',
                        style: TextStyle(
                            letterSpacing: 0.08,
                            fontSize: mediaQuery.size.width * 0.05,
                            fontWeight: FontWeight.w500)),
                    rating < 3
                        ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.thumb_down_alt_rounded,
                              color: Colors.red,
                            ),
                          )
                        ],
                          )
                        : Container(
                            child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.thumb_up_alt_rounded,
                                  color: Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.thumb_down_alt_rounded,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ))
                  ],
                ),
              ),
              Container(
                child: StarDisplay(
                  value: 3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Business: ${businessId}',
                  style: TextStyle(
                      letterSpacing: 0.08,
                      fontSize: mediaQuery.size.width * 0.04,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: 10,
              ),
              Text('Product: ${prodId}',
                  style: TextStyle(
                      letterSpacing: 0.08,
                      fontSize: mediaQuery.size.width * 0.04,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: 10,
              ),
              Container(
                width: mediaQuery.size.width * 0.85,
                child: Text('${comment}',
                    style: TextStyle(
                        letterSpacing: 0.08,
                        fontSize: mediaQuery.size.width * 0.04,
                        fontWeight: FontWeight.w300)),
              ),
            ],
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: mediaQuery.size.width * 0.05,
                top: mediaQuery.size.width * 0.01),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Feedback",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: mediaQuery.size.height * 0.045,
                    fontFamily: "Poppins"),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              Container(
                height: mediaQuery.size.height * 0.6,
                child: Expanded(
                    child: context.watch<FeedbackItems>().businessFeedback.isEmpty
                        ? Center(
                            child: Text(
                            "No Feedbacks to display",
                            style: TextStyle(
                                fontSize: mediaQuery.size.width * 0.05,
                                color: Colors.black),
                          ))
                        : ListView(
                            children: context
                                .watch<FeedbackItems>()
                                .businessFeedback
                                .map((data) => FeedbackItemCard(
                                    mediaQuery,
                                    data.businessId,
                                    data.userId,
                                    data.prodId,
                                    data.comment,
                                    data.rating))
                                .toList(),
                          )),
              )
            ]),
          )
        ],
      ),
    );
  }
}
