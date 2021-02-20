import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_user/features/user_fetch/data/models/github_user_model.dart';
import 'package:github_user/features/user_fetch/presentation/views/user_details_view.dart';

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
      child: Container(
        height: 110,
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  user.avatarUrl.isNotEmpty && user.avatarUrl != null
                      ? NetworkImage(user.avatarUrl)
                      : FlutterLogo(),
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              user.login ?? "",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Row(
            //       children: [
            //         Text("Name: ${user.name ?? ""}"),
            //         SizedBox(
            //           width: 15,
            //         ),
            //         Text(
            //           user.login ?? "",
            //         )
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Text(user.company ?? 'Company'),
            //         Text(user.location ?? 'location'),
            //       ],
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
