import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fsm_app/app/app.dart';
import 'package:fsm_app/app/injection_container.dart' as di;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initialApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await di.setupInjection();
  runApp(const App());
}
