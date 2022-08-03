import 'dart:io';

import 'package:flutter/material.dart';
import '../../models/business_info.dart';

class BusinessesList with ChangeNotifier {
  List<BusinessInfo> _business = [BusinessInfo()];

  List<BusinessInfo> get business => _business;

  Future<void> getBusinesses(String phoneNumber) async {
    print("Get businesses of $phoneNumber");
    _business = [
      BusinessInfo(),
      BusinessInfo(),
      BusinessInfo(),
      BusinessInfo(),
      BusinessInfo(),
      BusinessInfo(),
    ];
    // _business = [];
    notifyListeners();
  }

  Future<void> register(String name, String address, String phoneNumber,
      String? ntn, File? image) async {
    print("Registering $name");
    notifyListeners();
  }
}
