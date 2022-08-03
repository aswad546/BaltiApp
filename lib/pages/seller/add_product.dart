import 'dart:io';

import 'package:balti_app/models/product.dart';
import 'package:balti_app/pages/seller/product_list.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/auth_form_field.dart';
import '../../widgets/small_form_field.dart';
import '../../widgets/custom_icon_button.dart';
import '../../providers/BusinessProvider.dart';
import '../../providers/ProductProvider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final durationController = TextEditingController();

  File? imageFile;

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffffffff),
            leading: Padding(
              padding: EdgeInsets.only(left: mediaQuery.size.width * 0.032),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                iconSize: mediaQuery.size.width * 0.07,
                onPressed: () {},
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: mediaQuery.size.width * 0.032),
                child: IconButton(
                  icon: const Icon(Icons.swap_horiz),
                  color: Colors.black,
                  iconSize: mediaQuery.size.width * 0.07,
                  onPressed: () {},
                ),
              ),
            ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: mediaQuery.size.width / 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add a Product",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: mediaQuery.size.height * 0.051,
                    fontFamily: "Poppins"),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: mediaQuery.size.height * 0.02 * 2,
                        bottom: mediaQuery.size.height * 0.02,
                      ),
                      width: mediaQuery.size.height * 0.155,
                      height: mediaQuery.size.height * 0.155,
                      child: FloatingActionButton(
                          onPressed: () {
                            _getFromGallery();
                          },
                          backgroundColor: Color(0xffD9D9D9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  mediaQuery.size.width * 0.032)),
                          child: imageFile == null
                              ? Icon(
                                  Icons.camera_alt_rounded,
                                  color:
                                      const Color.fromARGB(193, 27, 209, 161),
                                  size: mediaQuery.size.width * 0.12,
                                )
                              : Image.file(
                                  imageFile!,
                                )),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01379,
                    ),
                    AuthFormField(
                      hintText: "Name of your Product",
                      formFieldKey: const ValueKey('username'),
                      fieldLabel: 'Name',
                      fieldController: nameController,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01379,
                    ),
                    AuthFormField(
                      hintText: "A brief description of your product",
                      formFieldKey: const ValueKey('Description'),
                      fieldLabel: 'Description',
                      fieldController: descriptionController,
                      minLines: 5,
                      maxLines: 10,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01379,
                    ),
                    Row(
                      children: [
                        SmallFormField(
                            hintText: "Price",
                            fieldController: priceController,
                            formFieldKey: const ValueKey('Price'),
                            fieldLabel: "Price"),
                        SizedBox(
                          width: mediaQuery.size.width * 0.07,
                        ),
                        SmallFormField(
                            hintText: "Time in Minutes",
                            fieldController: durationController,
                            formFieldKey: const ValueKey('Duration'),
                            fieldLabel: "Duration"),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 3 * 0.01379,
                    ),
                    CustomIconButton(
                      color: const Color.fromARGB(193, 27, 209, 161),
                      buttonLabel: "Add",
                      onPressHandler: () async {
                        if (_formKey.currentState!.validate()) {
                          // await Provider.of<Products>(context, listen: false)
                          //     .addProduct();
                          // Navigator.pop(context);
                          print(".................");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
