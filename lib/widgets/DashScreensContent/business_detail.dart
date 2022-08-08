import 'package:balti_app/widgets/AppBars/user_app_bar.dart';
import 'package:balti_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/product_card.dart';
import '../../../widgets/restaurant_cart.dart';
import '../../models/business.dart';
import '../../models/product.dart';
import '../../providers/business_provider.dart';
import '../../providers/product_provider.dart';
import '../../utils/size_config.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<Businesses>(context, listen: false)
          .fetchAndSetBusinesses();
      if (mounted) {
        await Provider.of<Products>(context, listen: false)
            .fetchAndSetProducts();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    SizeConfig().init(context);
    List<Business> businesses = Provider.of<Businesses>(
      context,
    ).businesses;
    List<Product> products = Provider.of<Products>(
      context,
    ).products;
    return Scaffold(
      appBar: const UserAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                    height: mediaQuery.size.height*0.28,
                    width: mediaQuery.size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        products[4].imageUrl,
                        colorBlendMode: BlendMode.dstATop,
                        color: Colors.white.withOpacity(0.9),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth / 24, top: SizeConfig.screenHeight / 72.5),
                child: Text(
                  businesses[1].name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SearchBar(),
              SizedBox(
                height: SizeConfig.screenHeight / 72.5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth / 36,
                  right: SizeConfig.screenWidth / 36,
                  bottom: SizeConfig.screenHeight / 72.5,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.08,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return ProductCard(
                      productName: products[i].name,
                      price: products[i].price.toInt().toString(),
                      delay: '${products[i].duration.toInt()} min',
                      isFav: false,
                      imageUrl: products[i].imageUrl,
                    );
                  },
                ),
              ),
              // Gridview for top products
            ],
          ),
        ),
      ),
    );
  }
}