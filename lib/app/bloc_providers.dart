import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_app/features/splash/presentation/blocs/theme_cubit.dart';

final blocProvider = [BlocProvider(create: (_) => ThemeCubit())];
