import 'package:get_it/get_it.dart';
import 'di_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
GetIt configureDependencies() => getIt.init();
