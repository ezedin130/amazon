import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Toast {
void showToast({required String msg}){
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.blue,
    textColor: Colors.red,
    fontSize: 18.0,
  );
}
}