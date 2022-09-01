import 'package:balti_app/pages/seller/add_product.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/business.dart';
import '../../models/product.dart';
import '../../providers/product_provider.dart';
import '../../utils/size_config.dart';
import '../../widgets/product_card.dart';
import 'edit_product.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key, required this.userId, required this.businessId})
      : super(key: key);
  final String userId;
  final String businessId;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<void> getProducts;

  @override
  void initState() {
    super.initState();
    getProducts = Future.delayed(Duration.zero, () async {
      // await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
      await Provider.of<Products>(context, listen: false)
          .findByBusinessId(widget.businessId);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("^^^^^^^^^^^^^^^^^^^^^^^^");
    print(widget.businessId);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    SizeConfig().init(context);
    List<Product> products = Provider.of<Products>(
      context,
    ).products;
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
                  iconSize: mediaQuery.size.width * 0.07,
                  onPressed: () {},
                ),
              ),
            ]),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            bottom: mediaQuery.size.width * 0.05,
            right: mediaQuery.size.width * 0.04,
            left: mediaQuery.size.width * 0.04,
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
            SizedBox(
              height: mediaQuery.size.height * 0.02,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: getProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.08,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: products.length,
                        itemBuilder: (BuildContext ctx, int i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProduct(
                                          product: products[i],
                                        )),
                              );
                            },
                            child: ProductCard(
                              productName: products[i].name,
                              price: products[i].price.toInt().toString(),
                              delay: '${products[i].duration.toInt()} min',
                              isFav: false,
                              imageUrl: "products[i].images[0]",
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
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
                  builder: (context) => AddProduct(
                        userId: widget.userId,
                        businessId: widget.businessId,
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
