import '../features/user_fetch/data/data_sources/remote_data_sources.dart';
import '../features/user_fetch/domain/repository/user_fetch_repository.dart';
import '../features/user_fetch/domain/use_cases/fetch_user.dart';
import '../features/user_fetch/domain/use_cases/fetch_user_repo.dart';
import '../features/user_fetch/domain/use_cases/search_user.dart';
import '../features/user_fetch/presentation/view_models/fetch_user_repo_view_model.dart';
import '../features/user_fetch/presentation/view_models/fetch_user_view_model.dart';
import '../features/user_fetch/presentation/view_models/search_view_model.dart';

import 'app_dependency_injection.dart';

// ignore: always_declare_return_types
registerSearchDependencies() {
  //VIEW MODELS
  AppDependencyInjection.di
      .registerFactory<SearchUserViewModel>(() => SearchUserViewModel(
            searchUsers: AppDependencyInjection.di(),
          ));
  AppDependencyInjection.di
      .registerFactory<FetchUserViewModel>(() => FetchUserViewModel(
            fetchUser: AppDependencyInjection.di(),
          ));
  AppDependencyInjection.di
      .registerFactory<FetchReposViewModel>(() => FetchReposViewModel(
            fetchUserGithubRepositories: AppDependencyInjection.di(),
          ));

  //USE CASES
  AppDependencyInjection.di.registerLazySingleton<SearchUsers>(
    () => SearchUsers(
      repository: AppDependencyInjection.di(),
    ),
  );
  AppDependencyInjection.di.registerLazySingleton<FetchUser>(
    () => FetchUser(
      repository: AppDependencyInjection.di(),
    ),
  );
  AppDependencyInjection.di.registerLazySingleton<FetchUserGithubRepositories>(
    () => FetchUserGithubRepositories(
      repository: AppDependencyInjection.di(),
    ),
  );

  //REPOSITORY
  AppDependencyInjection.di.registerLazySingleton<FetchUserRepository>(
    () => FetchUserRepositoryImpl(
      fetchUserData: AppDependencyInjection.di(),
    ),
  );

  //DATA SOURCES

  AppDependencyInjection.di.registerLazySingleton<FetchUserData>(
    () => FetchUserDataRemoteSource(),
  );
}
