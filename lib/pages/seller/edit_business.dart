import 'dart:io';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/business.dart';
import '../../providers/business_provider.dart';
import '../../widgets/auth_form_field.dart';
import '../../widgets/custom_icon_button.dart';

class EditBusiness extends StatefulWidget {
  const EditBusiness({Key? key, required this.business}) : super(key: key);
  final Business business;

  @override
  State<EditBusiness> createState() => _EditBusinessState();
}

class _EditBusinessState extends State<EditBusiness> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final descriptionController = TextEditingController();
  final typeController = TextEditingController();
  final addressController = TextEditingController();
  final ntnController = TextEditingController();

  File? imageFile;

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        print("*********************");
        print(pickedFile.path);
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    descriptionController.dispose();
    typeController.dispose();
    addressController.dispose();
    ntnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.business.name;
    descriptionController.text = widget.business.description;
    phoneNumberController.text = widget.business.phoneNumber;
    typeController.text = widget.business.type;
    addressController.text = widget.business.locationDescription;
    imageFile = File.fromUri(Uri.parse(widget.business.imageUrl));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Business",
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
                        top: mediaQuery.size.height * 0.01379,
                        bottom: mediaQuery.size.height * 0.01379,
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
                                  fit: BoxFit.fitWidth,
                                  width: mediaQuery.size.height * 0.155,
                                  height: mediaQuery.size.height * 0.155,
                                )),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01379,
                    ),
                    AuthFormField(
                      hintText: "Name",
                      formFieldKey: const ValueKey('username'),
                      fieldLabel: 'Name',
                      fieldIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      fieldController: nameController,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02069,
                    ),
                    AuthFormField(
                      hintText: "Address",
                      formFieldKey: const ValueKey('address'),
                      fieldLabel: 'Address',
                      fieldIcon: const Icon(Icons.home, color: Colors.black),
                      fieldController: addressController,
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
                      hintText: "What type of product/service do you provide?",
                      formFieldKey: const ValueKey('type'),
                      fieldLabel: 'Type',
                      fieldController: typeController,
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
                      height: mediaQuery.size.height * 0.02069,
                    ),
                    AuthFormField(
                      hintText: "NTN",
                      formFieldKey: const ValueKey('ntn'),
                      fieldLabel: 'NTN (optional)',
                      fieldIcon: const Icon(Icons.lock, color: Colors.black),
                      obscureText: true,
                      fieldController:
                          ntnController, // used to check if passwords are same
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.035,
                    ),
                    CustomIconButton(
                      color: const Color.fromARGB(193, 27, 209, 161),
                      icon: Icons.login,
                      buttonLabel: "Update",
                      onPressHandler: () async {
                        if (_formKey.currentState!.validate()) {
                          await Provider.of<Businesses>(context, listen: false)
                              .editBusiness(Business(
                                  id: widget.business.id,
                                  ownerId: widget.business.ownerId,
                                  name: nameController.text,
                                  phoneNumber: phoneNumberController.text,
                                  type: typeController.text,
                                  lat: widget.business.lat,
                                  lng: widget.business.lng,
                                  description: descriptionController.text,
                                  imageUrl: "imageURL",
                                  rating: 0,
                                  deliveryCharges: 0,
                                  locationDescription: addressController.text));
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const ProductList()),
                          // );
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01379,
                    ),
                    CustomIconButton(
                      color: const Color(0xffD11B26),
                      buttonLabel: "Delete",
                      onPressHandler: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ProductList()),
                        // );
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
