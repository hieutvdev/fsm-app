import 'package:flutter/material.dart';

abstract class BaseDeviceInfo {
  Future<String> getDeviceInfo(BuildContext context);
}
