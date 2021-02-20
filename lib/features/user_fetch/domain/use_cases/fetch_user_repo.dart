import 'package:dartz/dartz.dart';
import '../../../../core/error/app_failures.dart';
import '../../data/models/githup_repo_model.dart';
import '../repository/user_fetch_repository.dart';
import 'package:meta/meta.dart';

class FetchUserGithubRepositories {
  final FetchUserRepository repository;

  FetchUserGithubRepositories({@required this.repository});

  Future<Either<ActionFailure, List<GithubRepo>>> call(String login) async {
    return repository.fetchRepos(login);
  }
}
