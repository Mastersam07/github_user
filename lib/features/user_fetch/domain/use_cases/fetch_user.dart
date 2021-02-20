import 'package:dartz/dartz.dart';
import '../../../../core/error/app_failures.dart';
import '../../data/models/github_user_model.dart';
import '../repository/user_fetch_repository.dart';
import 'package:meta/meta.dart';

class FetchUser {
  final FetchUserRepository repository;

  FetchUser({@required this.repository});

  Future<Either<ActionFailure, GithubUser>> call(String login) async {
    return repository.fetchUser(login);
  }
}
