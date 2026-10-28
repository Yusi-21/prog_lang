import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final getIt = GetIt.instance; //singleton - only one example for all app

@InjectableInit()
void setupDI() => getIt.init();