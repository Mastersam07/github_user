import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/github_user_model.dart';
import '../views/user_details_view.dart';

class GithubUserCard extends StatelessWidget {
  final GithubUser user;

  const GithubUserCard({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => UserDetailsView(
              login: user.login,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  user.avatarUrl.isNotEmpty && user.avatarUrl != null
                      ? NetworkImage(user.avatarUrl)
                      : const FlutterLogo(),
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              user.login ?? '',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
