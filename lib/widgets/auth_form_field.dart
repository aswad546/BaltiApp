import 'package:flutter/material.dart';

class AuthFormField extends StatefulWidget {
  final bool obscureText;
  final Icon? fieldIcon;
  final String fieldLabel;
  final Key formFieldKey;
  final TextEditingController fieldController;
  final String? hintText;
  final TextEditingController? confirmPasswordController;
  final int? minLines;
  final int? maxLines;

  const AuthFormField({
    Key? key,
    this.obscureText = false,
    required this.fieldController,
    required this.formFieldKey,
    this.fieldIcon,
    required this.fieldLabel,
    this.confirmPasswordController,
    this.hintText,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  String? authFormValidator(value) {
    RegExp phoneNumberValid =
        RegExp(r'^((\+92)?(0092)?(92)?(0)?)(3)([0-9]{9})$/gm');
    RegExp ntnValid = RegExp(r'^[0-9]{8}$');

    if (widget.fieldLabel == "Confirm Password") {
      if (value == null || value.isEmpty) {
        return 'Please enter the password again';
      } else if (widget.confirmPasswordController!.text != value) {
        return "Password is not same";
      } else {
        return null;
      }
    } else if (widget.fieldLabel == "Phone Number") {
      if (value == null || value.isEmpty) {
        return "Please enter a phone number";
      } /*else if (!phoneNumberValid.hasMatch(value)) {
        return 'Please enter phone number in correct format';
      } */
      else {
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
    } else if (widget.fieldLabel == "Address") {
      if (value == null || value.isEmpty) {
        return 'Please enter your Address';
      } else {
        return null;
      }
    } else if (widget.fieldLabel == "Description") {
      if (value == null || value.isEmpty) {
        return 'Please enter a Description';
      } else {
        return null;
      }
    } else if (widget.fieldLabel == "NTN (optional)") {
      // if (!ntnValid.hasMatch(value)) {
      //   return 'Please enter phone number in correct format';
      // } else {
      //   return null;
      // }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldLabel,
          style: textTheme.labelMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          minLines: widget.obscureText ? 1 : widget.minLines,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
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
                fontSize: 14, color: Color.fromARGB(48, 0, 0, 0)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(33, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: widget.fieldIcon == null
                ? null
                : Align(
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
