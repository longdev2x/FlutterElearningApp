import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo(String message) {
  return Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    fontSize: 16,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
  );
}
