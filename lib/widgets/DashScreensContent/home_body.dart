import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/product_card.dart';
import '../../../widgets/restaurant_cart.dart';
import '../../models/business.dart';
import '../../models/product.dart';
import '../../providers/business_provider.dart';
import '../../providers/product_provider.dart';
import '../../utils/size_config.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
    SizeConfig().init(context);
    List<Business> businesses = Provider.of<Businesses>(
      context,
    ).businesses;
    List<Product> products = Provider.of<Products>(
      context,
    ).products;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight / 29,
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth / 24),
              child: const Text(
                'Trending near you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 72.5,
            ),
            Container(
              height: SizeConfig.screenHeight / 4.53125,
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth / 36,
              ),
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: businesses.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return RestaurantCard(
                    restaurantName: businesses[i].name,
                    imagePath: businesses[i].imageUrl,
                  );
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 29,
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth / 24),
              child: const Text(
                'Top products',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.08,
                  crossAxisSpacing: SizeConfig.screenWidth / 24,
                  mainAxisSpacing: SizeConfig.screenHeight / 48.33,
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
    );
  }
}
