import 'package:flutter/material.dart';
import 'package:github_user/core/core_presentation/core_view_model/core_view_model.dart';
import 'package:github_user/features/user_fetch/presentation/view_models/search_view_model.dart';
import 'package:github_user/features/user_fetch/presentation/widgets/github_user_list_tile.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<SearchUserViewModel>(
              builder: (context, provider, child) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Search for github users at will"),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(controller),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.search(context, controller.text);
                      },
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Search"),
                        ),
                      ),
                    )
                  ],
                ),
                provider.appViewState == ViewState.loading
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : controller.text.isEmpty &&
                            provider.userSearchResult.users.isEmpty
                        ? Expanded(
                            child: Center(
                            child: Text(
                                "Enter text and hit search to start searching"),
                          ))
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Search results for ${provider.searchQuery ?? ""}",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Result Count: ${provider.userSearchResult.users.length ?? ""} results",
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    if (provider
                                        .userSearchResult.users.isEmpty) {
                                      return Text("NO user found");
                                    } else {
                                      List resultList = List.generate(
                                          provider
                                              .userSearchResult.users.length,
                                          (index) => GithubUserCard(
                                              user: provider.userSearchResult
                                                  .users[index]));
                                      return resultList[index];
                                    }
                                  },
                                  itemCount:
                                      provider.userSearchResult.users.length,
                                )),
                              ],
                            ),
                          ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

buildTextField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: "Search github",
      filled: true,
      fillColor: Colors.black54,
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 25,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF828282)),
        borderRadius: BorderRadius.circular(5),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF828282)),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
