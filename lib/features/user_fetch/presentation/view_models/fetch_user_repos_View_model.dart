import 'package:flutter/cupertino.dart';
import '../../../../core/core_presentation/core_view_model/core_view_model.dart';
import '../../data/models/githup_repo_model.dart';
import '../../domain/use_cases/fetch_user_repo.dart';
import 'package:meta/meta.dart';

class FetchReposViewModel extends BaseViewModel {
  final FetchUserGithubRepositories fetchUserGithubRepositories;

  FetchReposViewModel({@required this.fetchUserGithubRepositories});

  List<GithubRepo> userRepo = [];
  Future<void> fetchUserDetails(BuildContext context, String login) async {
    setState(viewState: ViewState.loading);
    final result = await fetchUserGithubRepositories(login);
    result.fold((failure) => handleFailure(context, failure), (fetchedRepo) {
      userRepo = fetchedRepo;
      print(fetchedRepo[0].name);
    });
    setState(viewState: ViewState.idle);
  }
}
