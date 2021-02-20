import 'package:github_user/features/user_fetch/data/models/github_user_model.dart';

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.users != null) {
      data['items'] = this.users.map((user) => user.toJson()).toList();
    }
    return data;
  }
}
