import 'package:flutter/cupertino.dart';
import 'package:github_user/core/core_presentation/core_view_model/core_view_model.dart';
import 'package:github_user/features/user_fetch/data/models/search_result.dart';
import 'package:github_user/features/user_fetch/domain/use_cases/search_user.dart';
import 'package:meta/meta.dart';

class SearchUserViewModel extends BaseViewModel {
  final SearchUsers searchUsers;

  SearchUserViewModel({@required this.searchUsers});
  UserSearchResult userSearchResult = UserSearchResult(
    users: [],
    totalCount: 0,
    incompleteResults: false,
  );
  String searchQuery = "";
  Future<void> search(BuildContext context, String query) async {
    setState(viewState: ViewState.loading);
    print("Search started");
    final result = await searchUsers(query);
    print("Search done ffs");
    result.fold((failure) => handleFailure(context, failure), (searchResult) {
      searchQuery = query;
      userSearchResult = searchResult;
    });
    setState(viewState: ViewState.idle);
  }
}
