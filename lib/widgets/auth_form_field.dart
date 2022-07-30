import 'package:flutter/material.dart';

class AuthFormField extends StatefulWidget {
  final bool obscureText;
  final Icon fieldIcon;
  final String fieldLabel;
  final Key formFieldKey;
  final TextEditingController fieldController;
  final String? hintText;

  const AuthFormField({
    Key? key,
    this.obscureText = false,
    required this.fieldController,
    required this.formFieldKey,
    required this.fieldIcon,
    required this.fieldLabel,
    this.hintText,
  }) : super(key: key);

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  String? authFormValidator(value) {
    RegExp phoneNumberValid =
        RegExp(r'^((\+92)?(0092)?(92)?(0)?)(3)([0-9]{9})$/gm');

    if (widget.fieldLabel == "Confirm Password") {
      if (value == null || value.isEmpty) {
        return 'Please enter the password again';
      } /* else if (p1controller.text != value) {
        return "Password is not same";
      } */
      else {
        return null;
      }
    } else if (widget.fieldLabel == "Phone Number") {
      if (value == null || value.isEmpty) {
        return "Please enter a phone number";
      } else if (!phoneNumberValid.hasMatch(value)) {
        return 'Please enter phone number in correct format';
      } else {
        return null;
      }
      /* Validation logic for phone number */
    } else if (widget.fieldLabel == "Password") {
      if (value == null || value.isEmpty) {
        return 'Please enter a password';
      } else {
        return null;
      }
    } else if (widget.fieldLabel == "Name") {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldLabel,
          style: _textTheme.labelMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          key: widget.formFieldKey,
          obscureText: widget.obscureText,
          style: const TextStyle(
            fontSize: 16,
          ),
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 16, color: Color.fromARGB(48, 0, 0, 0)),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(33, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: Align(
              widthFactor: 1,
              heightFactor: 1.0,
              child: widget.fieldIcon,
            ),
            fillColor: const Color.fromARGB(255, 249, 249, 250),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          validator: authFormValidator,
          controller: widget.fieldController,
        ),
      ],
    );
  }
}
