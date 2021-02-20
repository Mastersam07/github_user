import '../../../dependency_injection/app_dependency_injection.dart';
import '../../../features/user_fetch/presentation/view_models/fetch_user_view_model.dart';
import '../../../features/user_fetch/presentation/view_models/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<FetchUserViewModel>(
      create: (context) =>
          FetchUserViewModel(fetchUser: AppDependencyInjection.di())),
  ChangeNotifierProvider<SearchUserViewModel>(
      create: (context) =>
          SearchUserViewModel(searchUsers: AppDependencyInjection.di())),
];
