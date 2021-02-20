import 'package:flutter/cupertino.dart';
import 'package:github_user/core/core_presentation/core_view_model/core_view_model.dart';
import 'package:github_user/features/user_fetch/data/models/github_user_model.dart';
import 'package:github_user/features/user_fetch/domain/use_cases/fetch_user.dart';
import 'package:meta/meta.dart';

class FetchUserViewModel extends BaseViewModel {
  final FetchUser fetchUser;

  FetchUserViewModel({@required this.fetchUser});
  GithubUser user = GithubUser();
  Future<void> fetchUserDetails(BuildContext context, String login) async {
    setState(viewState: ViewState.loading);
    print("loading details");
    final result = await fetchUser(login);
    print("done");
    result.fold((failure) => handleFailure(context, failure), (fetchedUser) {
      user = fetchedUser;
      print(fetchedUser.name);
    });
    setState(viewState: ViewState.idle);
  }
}
