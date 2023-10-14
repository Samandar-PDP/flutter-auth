import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loading() {
  return Center(child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator());
}