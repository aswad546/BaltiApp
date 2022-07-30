import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_form_field.dart';
import '../../widgets/custom_icon_button.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuery.size.width / 12,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: mediaQuery.size.height * 0.0275,
                  ),
                  width: mediaQuery.size.width * 0.55,
                  height: mediaQuery.size.height * 0.275,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.04125,
                ),
                AuthFormField(
                  hintText: "+923204457283",
                  formFieldKey: const ValueKey('phone_no'),
                  fieldLabel: 'Phone Number',
                  fieldIcon: const Icon(
                    Icons.phone_android_outlined,
                    color: Colors.black,
                  ),
                  fieldController: emailController,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.04125,
                ),
                AuthFormField(
                  formFieldKey: const ValueKey('password'),
                  fieldLabel: 'Password',
                  fieldIcon: const Icon(Icons.lock, color: Colors.black),
                  obscureText: true,
                  fieldController: passwordController,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.168,
                ),
                CustomIconButton(
                  color: const Color.fromARGB(193, 27, 209, 161),
                  icon: Icons.login,
                  buttonLabel: "LOGIN",
                  onPressHandler: () async {
                    if (_formKey.currentState!.validate()) {
                      await Provider.of<Auth>(context, listen: false).login(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
