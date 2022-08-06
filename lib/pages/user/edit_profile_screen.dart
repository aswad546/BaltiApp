import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/custom_icon_button.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: SizeConfig.screenWidth / 5.143,
                  foregroundImage: const AssetImage(
                    'assets/images/avatar.png',
                  ),
                ),
                Positioned(
                  top: SizeConfig.screenWidth / 3.6,
                  left: SizeConfig.screenWidth / 3.6,
                  child: Container(
                    height: SizeConfig.screenWidth / 9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x00000000).withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth / 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    key: const ValueKey('userName'),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.all(SizeConfig.screenWidth / 30),
                      fillColor: const Color(0xD9d9d9d9),
                      hintText: 'User name',
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(33, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(0, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    controller: nameController,
                    validator: (input) {
                      if (input == '') {
                        return 'Enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 24.17,
                  ),
                  const Text(
                    "Phone",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    key: const ValueKey('phoneNumber'),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.all(SizeConfig.screenWidth / 30),
                      fillColor: const Color(0xD9d9d9d9),
                      hintText: '0320 4457283',
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(33, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(0, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    controller: phoneNumberController,
                    validator: (input) {
                      if (input == '') {
                        return 'Enter a phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight / 4.833,
                  ),
                  CustomIconButton(
                    color: const Color.fromARGB(193, 27, 209, 161),
                    buttonLabel: "Save",
                    icon: Icons.save_outlined,
                    onPressHandler: () async {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
