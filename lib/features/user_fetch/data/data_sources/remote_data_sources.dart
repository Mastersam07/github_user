import 'dart:convert';

import '../../../../core/error/app_exceptions.dart';
import '../models/github_user_model.dart';
import '../models/githup_repo_model.dart';
import '../models/search_result.dart';
import 'package:http/http.dart' as http;

abstract class FetchUserData {
  Future<UserSearchResult> search(String query);
  Future<GithubUser> fetchUser(String login);
  Future<List<GithubRepo>> fetchUserRepos(String login);
}

class FetchUserDataRemoteSource implements FetchUserData {
  final String baseApiUrl = 'https://api.github.com';
  @override
  Future<GithubUser> fetchUser(String login) async {
    final requestUrl = '$baseApiUrl/users/$login';
    final response = await http.get(requestUrl);
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GithubUser.fromJson(jsonData);
    } else {
      throw ServerException('There was an error fetching results');
    }
  }

  @override
  Future<UserSearchResult> search(String query) async {
    final requestUrl = '$baseApiUrl/search/users?q=$query';
    final response = await http.get(requestUrl);
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserSearchResult.fromJson(jsonData);
    } else {
      throw ServerException('There was an error fetching results');
    }
  }

  @override
  Future<List<GithubRepo>> fetchUserRepos(String login) async {
    final requestUrl = '$baseApiUrl/users/$login/repos';
    final response = await http.get(requestUrl);
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return List.generate(
          jsonData.length, (index) => GithubRepo.fromJson(jsonData[index]));
    } else {
      throw ServerException('There was an error fetching results');
    }
  }
}
