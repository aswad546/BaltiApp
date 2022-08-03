import 'package:balti_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/product_card.dart';
import '../../../widgets/restaurant_cart.dart';
import '../../models/business.dart';
import '../../models/product.dart';
import '../../providers/BusinessProvider.dart';
import '../../providers/ProductProvider.dart';
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
    );
  }
}