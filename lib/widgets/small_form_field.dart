import 'package:flutter/material.dart';

class SmallFormField extends StatefulWidget {
  final bool obscureText;
  final Icon? fieldIcon;
  final String fieldLabel;
  final Key formFieldKey;
  final TextEditingController fieldController;
  final String? hintText;
  final TextEditingController? confirmPasswordController;

  const SmallFormField({
    Key? key,
    this.obscureText = false,
    required this.fieldController,
    required this.formFieldKey,
    this.fieldIcon,
    required this.fieldLabel,
    this.confirmPasswordController,
    this.hintText,
  }) : super(key: key);

  @override
  State<SmallFormField> createState() => _SmallFormFieldState();
}

class _SmallFormFieldState extends State<SmallFormField> {
  String? validator(value) {
    RegExp priceValid = RegExp(r'^[0-9]*$');
    if (widget.fieldLabel == "Price") {
      if (value == null || value.isEmpty) {
        return 'Please enter a Price';
      } else if (!priceValid.hasMatch(value)) {
        return 'Please enter price in numbers only';
      } else {
        return null;
      }
    } else if (widget.fieldLabel == "Duration") {
      /*else if (!priceValid.hasMatch(value)) {
        return 'Please enter duration in numbers only';
      } else {
        return null;
      }*/
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
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
        SizedBox(
          width: mediaQuery.size.width * 0.38,
          child: TextFormField(
            minLines: 1,
            maxLines: 1,
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
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
            validator: validator,
            controller: widget.fieldController,
          ),
        ),
      ],
    );
  }
}