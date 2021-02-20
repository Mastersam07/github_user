import 'dart:convert';

import 'package:github_user/core/error/app_exceptions.dart';
import 'package:github_user/features/user_fetch/data/models/github_user_model.dart';
import 'package:github_user/features/user_fetch/data/models/githup_repo_model.dart';
import 'package:github_user/features/user_fetch/data/models/search_result.dart';
import 'package:http/http.dart' as http;

abstract class FetchUserData {
  Future<UserSearchResult> search(String query);
  Future<GithubUser> fetchUser(String login);
  Future<List<GithubRepo>> fetchUserRepos(String login);
}

class FetchUserDataRemoteSource implements FetchUserData {
  final String baseApiUrl = "https://api.github.com";
  @override
  Future<GithubUser> fetchUser(String login) async {
    String requestUrl = "$baseApiUrl/users/$login";
    http.Response response = await http.get(requestUrl);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GithubUser.fromJson(jsonData);
    } else {
      throw ServerException("There was an error fetching results");
    }
  }

  @override
  Future<UserSearchResult> search(String query) async {
    String requestUrl = "$baseApiUrl/search/users?q=$query";
    http.Response response = await http.get(requestUrl);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserSearchResult.fromJson(jsonData);
    } else {
      throw ServerException("There was an error fetching results");
    }
  }

  @override
  Future<List<GithubRepo>> fetchUserRepos(String login) async {
    String requestUrl = "$baseApiUrl/users/$login/repos";
    http.Response response = await http.get(requestUrl);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return List.generate(
          jsonData.length, (index) => GithubRepo.fromJson(jsonData[index]));
    } else {
      throw ServerException("There was an error fetching results");
    }
  }
}
