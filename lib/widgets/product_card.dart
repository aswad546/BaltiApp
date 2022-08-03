import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.productName,
    required this.imageUrl,
    required this.delay,
    required this.price,
    required this.isFav,
  }) : super(key: key);

  final String productName;
  final String delay;
  final String imageUrl;
  final String price;
  final bool isFav;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.blue,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        widget.imageUrl,
                        colorBlendMode: BlendMode.dstATop,
                        color: Colors.white.withOpacity(0.9),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.screenHeight / 48.3333,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenHeight / 362.5,
                        horizontal: SizeConfig.screenWidth / 120,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFEFE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: Colors.black,
                            size: 8,
                          ),
                          SizedBox(width: SizeConfig.screenWidth / 240),
                          Text(
                            widget.delay,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth / 51.429,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth / 3,
                    child: Text(
                      widget.productName,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                  Text(
                    'PKR ${widget.price}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(
                  size: 20,
                  Icons.favorite_border_sharp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
