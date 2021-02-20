import 'package:dartz/dartz.dart';
import 'package:github_user/core/error/app_failures.dart';
import 'package:github_user/features/user_fetch/data/models/search_result.dart';
import 'package:github_user/features/user_fetch/domain/repository/user_fetch_repository.dart';
import 'package:meta/meta.dart';

class SearchUsers {
  final FetchUserRepository repository;

  SearchUsers({@required this.repository});

  Future<Either<ActionFailure, UserSearchResult>> call(String query) async {
    return await repository.search(query);
  }
}
