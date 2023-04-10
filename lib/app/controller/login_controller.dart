import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';

import '../api_services/api_client/api_client.dart';
import '../api_services/api_provider/login_provider.dart';

class LoginController extends GetxController {
  bool? _isLogged;
  final bool _fetching = false;
  var isOtpScreen = false.obs;
  bool get fetching => _fetching;
  bool? get isLogged => _isLogged;

  Map<String, dynamic>? _userData;
  Map<String, dynamic>? get userData => _userData;
  String phone = '';
  var writeotp = '';

  callLogin() {
    Client client = Client();

    LoginProvider(client: client.init()).Login(phone);
  }

  String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  Future<void> login() async {}

  RxBool isLoading = false.obs;
}
