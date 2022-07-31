import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_form_field.dart';
import '../../widgets/custom_icon_button.dart';
import '../../providers/auth_provider.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;

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
                  width: mediaQuery.size.width * 0.3889,
                  height: mediaQuery.size.height * 0.1931,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.01379,
                ),
                AuthFormField(
                  hintText: "Username",
                  formFieldKey: const ValueKey('username'),
                  fieldLabel: 'Name',
                  fieldIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  fieldController: userNameController,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.02069,
                ),
                AuthFormField(
                  hintText: "+923204457283",
                  formFieldKey: const ValueKey('phone_no'),
                  fieldLabel: 'Phone Number',
                  fieldIcon: const Icon(
                    Icons.phone_android_outlined,
                    color: Colors.black,
                  ),
                  fieldController: phoneNumberController,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.02069,
                ),
                AuthFormField(
                  hintText: "Password",
                  formFieldKey: const ValueKey('password'),
                  fieldLabel: 'Password',
                  fieldIcon: const Icon(Icons.lock, color: Colors.black),
                  obscureText: true,
                  fieldController: passwordController,
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.02069,
                ),
                AuthFormField(
                  hintText: "Confirm Password",
                  formFieldKey: const ValueKey('confirm_password'),
                  fieldLabel: 'Confirm Password',
                  fieldIcon: const Icon(Icons.lock, color: Colors.black),
                  obscureText: true,
                  fieldController: confirmPasswordController,
                  confirmPasswordController:
                      passwordController, // used to check if passwords are same
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.08275,
                ),
                CustomIconButton(
                  color: const Color.fromARGB(193, 27, 209, 161),
                  icon: Icons.login,
                  buttonLabel: "Sign Up",
                  onPressHandler: () async {
                    if (_formKey.currentState!.validate()) {
                      await Provider.of<Auth>(context, listen: false).signUp(
                        userNameController.text,
                        phoneNumberController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: textTheme.subtitle2,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        'Login',
                        style: textTheme.subtitle2!.copyWith(
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
