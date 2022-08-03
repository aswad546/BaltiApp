import 'package:balti_app/pages/seller/add_business.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth/signup_screen.dart';
import 'pages/auth/login_screen.dart';
import 'pages/seller/seller_dashboard.dart';
import 'pages/seller/business_list.dart';
import 'pages/seller/product_list.dart';
import 'pages/seller/add_business.dart';
import 'providers/auth_provider.dart';
import 'providers/business_list_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: BusinessList());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => BusinessesList(),
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        return MaterialApp(
          title: 'Balti App',
          theme: ThemeData(
            primaryColor: const Color.fromARGB(193, 27, 209, 161),
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
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
            // '/': (ctx) => const LoginScreen(),
            // SignUpScreen.routeName: (ctx) => const SignUpScreen(),
            '/': (_) => const AddBusiness(),
          },
        );
      }),
    );
  }
}
