import 'package:flutter/material.dart';
import '../../../../core/core_presentation/core_view_model/core_view_model.dart';
import '../view_models/search_view_model.dart';
import '../widgets/github_user_list_tile.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<SearchUserViewModel>(
              builder: (context, provider, child) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('Search for github users at will'),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(controller),
                    ),
                    const SizedBox(
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
                        child: const Center(
                          child: Text('Search'),
                        ),
                      ),
                    )
                  ],
                ),
                provider.appViewState == ViewState.loading
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : controller.text.isEmpty &&
                            provider.userSearchResult.users.isEmpty
                        ? const Expanded(
                            child: Center(
                            child: Text('''
Enter text and hit search to start searching'''),
                          ))
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  """
Search results for ${provider.searchQuery ?? ""}""",
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  """
Result Count: ${provider.userSearchResult.users.length ?? ""} results""",
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    if (provider
                                        .userSearchResult.users.isEmpty) {
                                      return const Text('NO user found');
                                    } else {
                                      final resultList = List.generate(
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

TextFormField buildTextField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Search github',
      filled: true,
      fillColor: Colors.black54,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 25,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF828282)),
        borderRadius: BorderRadius.circular(5),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF828282)),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
