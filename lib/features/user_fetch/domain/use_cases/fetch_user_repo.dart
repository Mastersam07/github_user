import 'package:dartz/dartz.dart';
import 'package:github_user/core/error/app_failures.dart';
import 'package:github_user/features/user_fetch/data/models/githup_repo_model.dart';
import 'package:github_user/features/user_fetch/domain/repository/user_fetch_repository.dart';
import 'package:meta/meta.dart';

class FetchUserGithubRepositories {
  final FetchUserRepository repository;

  FetchUserGithubRepositories({@required this.repository});

  Future<Either<ActionFailure, List<GithubRepo>>> call(String login) async {
    return await repository.fetchRepos(login);
  }
}
