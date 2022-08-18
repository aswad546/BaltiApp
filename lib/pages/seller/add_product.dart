import 'dart:io';
import 'dart:typed_data';

import 'package:balti_app/models/product.dart';
import 'package:balti_app/widgets/video_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:mime/mime.dart';

import '../../providers/product_provider.dart';
import '../../utils/size_config.dart';
import '../../widgets/auth_form_field.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/small_form_field.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key, required this.userId, required this.businessId})
      : super(key: key);
  final String userId;
  final String businessId;

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
  late List<File> files = [];
  late List<String> images = [];
  late List<String> videos = [];
  late int currentPos = 0;
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  bool isImage(String? path) {
    final mimeType = lookupMimeType(path!);

    return mimeType!.startsWith('image/');
  }

  _getFromGallery() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.media);
    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      for (var i = 0; i < result.paths.length; i = i + 1) {
        if (isImage(result.paths[i])) {
          images.add(result.paths[i].toString());
        } else {
          videos.add(result.paths[i].toString());
        }
      }
      setState(() {});
    } else {
      // User canceled the picker
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    durationController.dispose();
    // _controller.dispose();
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
                    files.isEmpty
                        ? Container(
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
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  color:
                                      const Color.fromARGB(193, 27, 209, 161),
                                  size: mediaQuery.size.width * 0.12,
                                )),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: mediaQuery.size.height * 0.01379,
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     _getFromGallery();
                              //   },
                              //   child:
                              CarouselSlider(
                                items: files
                                    .map(
                                      (file) => Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.screenHeight / 36.25,
                                        ),
                                        width: mediaQuery.size.width * 0.5,
                                        height: SizeConfig.screenHeight / 3.625,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: isImage(file.path)
                                                ? Image(
                                                    image: FileImage(
                                                        File(file.path)),
                                                    fit: BoxFit.cover,
                                                  )
                                                : VideoBuilder(
                                                    videoPath: file.path)),
                                      ),
                                    )
                                    .toList(),
                                options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentPos = index;
                                      });
                                    },
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.5,
                                    enableInfiniteScroll: false),
                              ),
                              // ),
                              SizedBox(
                                height: mediaQuery.size.height * 0.01379,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: files.map((file) {
                                    int index = files.indexOf(file);
                                    return Container(
                                      width: mediaQuery.size.height * 0.009,
                                      height: mediaQuery.size.height * 0.009,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              mediaQuery.size.width * 0.01),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentPos == index
                                            ? Color.fromRGBO(0, 0, 0, 0.9)
                                            : Color.fromRGBO(0, 0, 0, 0.4),
                                      ),
                                    );
                                  }).toList()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        _getFromGallery();
                                      },
                                      child: Text(
                                        "Reselect",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize:
                                                mediaQuery.size.height * 0.015),
                                      )),
                                  SizedBox(
                                    width: mediaQuery.size.width * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          files = [];
                                        });
                                      },
                                      child: Text(
                                        "Remove all",
                                        style: TextStyle(
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize:
                                                mediaQuery.size.height * 0.015),
                                      )),
                                ],
                              ),
                            ],
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
                            hintText: "In Minutes",
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
                      icon: Icons.login,
                      buttonLabel: "Add",
                      onPressHandler: () async {
                        if (_formKey.currentState!.validate()) {
                          print(
                              "****************  FORM KEY VALIDATED  ***************");
                          print(widget.businessId);
                          await Provider.of<Products>(context, listen: false)
                              .addProduct(Product(
                                  id: " ",
                                  name: nameController.text,
                                  businessId: widget.businessId,
                                  description: descriptionController.text,
                                  price: double.parse(priceController.text),
                                  rating: 0,
                                  duration:
                                      double.parse(durationController.text),
                                  imageUrl: "assets/images/burger.jpg",
                                  images: images,
                                  videos: videos));
                          // Navigator.pop(context);
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
