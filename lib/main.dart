import 'package:flutter/material.dart';
import 'package:github_user/core/core_presentation/core_view_model/providers.dart';
import 'package:github_user/dependency_injection/app_dependency_injection.dart';
import 'package:provider/provider.dart';

import 'features/user_fetch/presentation/views/home_search_view.dart';

void main() {
  AppDependencyInjection.registerDependencies();
  runApp(GithubExercise());
}

class GithubExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
