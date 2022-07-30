import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/user/login_screen.dart';
import 'providers/auth_provider.dart';

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
        )
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        return MaterialApp(
          title: 'Balti App',
          theme: ThemeData(
            primaryColor: const Color.fromARGB(193, 27, 209, 161),
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
              labelMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          home: const LoginScreen(),
        );
      }),
    );
  }
}
