import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class BaseDeviceInfoImpl implements BaseDeviceInfo {
  final DeviceInfoPlugin deviceInfoPlugin;
  Map<String, dynamic> _data = {};

  BaseDeviceInfoImpl(this.deviceInfoPlugin);

  @override
  Future<String> getDeviceInfo(BuildContext context) async {
    String info;
    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        info = 'Android Device: ${androidInfo.model}';
        _data = {
          'model': androidInfo.model,
          'version': androidInfo.version.release,
          'manufacturer': androidInfo.manufacturer,
        };
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        info = 'iOS Device: ${iosInfo.utsname.machine}';
        _data = {
          'machine': iosInfo.utsname.machine,
          'systemName': iosInfo.utsname.sysname,
          'systemVersion': iosInfo.systemVersion,
        };
      } else {
        info = 'Unsupported platform';
      }
    } catch (e) {
      info = 'Failed to get device info: $e';
    }
    return info;
  }

  @override
  Map<String, dynamic> get data => _data;

  @override
  Map<String, dynamic> toMap() {
    return _data;
  }
}
