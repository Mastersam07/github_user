import 'package:flutter/material.dart';
import '../../../../core/core_presentation/core_view_model/core_view_model.dart';
import '../view_models/fetch_user_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatefulWidget {
  final String login;

  const UserDetailsView({Key key, this.login}) : super(key: key);
  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FetchUserViewModel>(context, listen: false)
          .fetchUserDetails(context, widget.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchUserViewModel>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            provider.user?.name ?? 'Name',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
        ),
        body: provider.appViewState == ViewState.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(provider.user?.avatarUrl ??
                            'https://avatars.githubusercontent.com/u/583231?s=460&u=a59fef2a493e2b67dd13754231daf220c82ba84d&v=4'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          provider.user?.name ?? 'Name',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          'Number of followers: ${provider.user?.followers}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          'Number of following: ${provider.user?.following}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          '''
Number of public gists: ${provider.user?.publicGists}''',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          '''
Number of public repo: ${provider.user?.publicRepos}''',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          provider.user?.hireable.toString() == 'null'
                              ? 'Available for hire : Unknown'
                              : 'Available for hire : ' +
                                  provider.user?.hireable.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
