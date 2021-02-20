import 'package:dartz/dartz.dart';
import '../../../../core/error/app_failures.dart';
import '../../data/models/search_result.dart';
import '../repository/user_fetch_repository.dart';
import 'package:meta/meta.dart';

class SearchUsers {
  final FetchUserRepository repository;

  SearchUsers({@required this.repository});

  Future<Either<ActionFailure, UserSearchResult>> call(String query) async {
    return repository.search(query);
  }
}
