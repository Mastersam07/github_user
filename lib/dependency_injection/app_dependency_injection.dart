import 'package:get_it/get_it.dart';
import 'search_dependency_injection.dart';

class AppDependencyInjection {
  static final di = GetIt.instance;
  // ignore: always_declare_return_types
  static registerDependencies() {
    registerSearchDependencies();
  }
}
