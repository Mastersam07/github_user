import 'package:flutter/material.dart';
import 'core/core_presentation/core_view_model/providers.dart';
import 'dependency_injection/app_dependency_injection.dart';
import 'package:provider/provider.dart';

import 'features/user_fetch/presentation/views/home_search_view.dart';

void main() {
  AppDependencyInjection.registerDependencies();
  runApp(const GithubExercise());
}

class GithubExercise extends StatelessWidget {
  const GithubExercise({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
