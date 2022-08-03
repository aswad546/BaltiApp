import 'package:balti_app/widgets/DashScreensContent/business_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth/signup_screen.dart';
import 'pages/user/map_screen.dart';
import 'pages/user/user_dash_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/business_provider.dart';
import 'providers/location_provider.dart';
import 'providers/product_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Businesses>(
          create: (_) => Businesses(
            authToken: '',
            businesses: [],
            userId: '',
          ),
          update: (ctx, auth, previousBusinesses) => Businesses(
            authToken: 'auth.token!',
            businesses: previousBusinesses == null
                ? []
                : previousBusinesses.getBusinesses,
            userId: auth.userId,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(
            authToken: '',
            products: [],
            userId: '',
          ),
          update: (ctx, auth, previousProducts) => Products(
            authToken: 'auth.token!',
            products:
                previousProducts == null ? [] : previousProducts.getProducts,
            userId: auth.userId,
          ),
        ),
        ChangeNotifierProvider<Location>(
          create: (_) => Location(),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        return MaterialApp(
          title: 'Balti App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromARGB(193, 27, 209, 161),
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
              headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              labelMedium: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              subtitle2: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          routes: {
            '/': (ctx) => const BusinessDetail(),
            // '/': (ctx) => const UserDashScreen(),
            // SignUpScreen.routeName: (ctx) => const SignUpScreen(),
            // MapScreen.routeName: (context) => const MapScreen() 
          },
        );
      }),
    );
  }
}
