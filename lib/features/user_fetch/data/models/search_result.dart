import 'github_user_model.dart';

class UserSearchResult {
  int totalCount;
  bool incompleteResults;
  List<GithubUser> users;

  UserSearchResult({this.totalCount, this.incompleteResults, this.users});

  UserSearchResult.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      users = List<GithubUser>();
      json['items'].forEach((user) {
        users.add(GithubUser.fromJson(user));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['total_count'] = totalCount;
    data['incomplete_results'] = incompleteResults;
    if (users != null) {
      data['items'] = users.map((user) => user.toJson()).toList();
    }
    return data;
  }
}
