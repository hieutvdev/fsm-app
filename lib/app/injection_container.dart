import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fsm_app/core/platform/base_device_info_impl.dart';
import 'package:fsm_app/core/platform/network_info.dart';
import 'package:fsm_app/core/platform/network_info_impl.dart';
import 'package:fsm_app/core/storage/token_storage.dart';
import 'package:fsm_app/core/storage/token_storage_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/shared_preferences_service.dart';
import '../core/services/shared_preferences_service_impl.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<DeviceInfoPlugin>(DeviceInfoPlugin());

  getIt.registerSingleton<BaseDeviceInfo>(
      BaseDeviceInfoImpl(getIt<DeviceInfoPlugin>()));

  getIt.registerSingleton<SharedPreferencesService>(
    SharedPreferencesServiceImpl(sharedPreferences),
  );

  getIt.registerSingleton<NetworkInfo>(
    NetworkInfoImpl(Connectivity()),
  );

  getIt.registerSingleton<TokenStorage>(
    TokenStorageImpl(getIt<SharedPreferencesService>()),
  );
}
