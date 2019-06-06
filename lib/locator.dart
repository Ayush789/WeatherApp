import 'package:get_it/get_it.dart';

import 'core/viewmodel/home_view_model.dart';


GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(()=>HomeViewModel());
}
