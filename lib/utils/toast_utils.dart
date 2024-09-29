import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void notify(String msg,ToastificationType toastificationType) {
  toastification.dismissAll();
  toastification.show(
    title: Text(msg),
    autoCloseDuration: const Duration(seconds: 10),
    type: toastificationType,
    style: ToastificationStyle.fillColored,
    showProgressBar: false,
    alignment: Alignment.bottomCenter,
  );
}