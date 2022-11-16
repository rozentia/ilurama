import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import 'posts.vm.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      builder: (context, model, child) {
        return const Scaffold(body: Text('Posts View'));
      },
      viewModelBuilder: () => PostsViewModel(),
    );
  }
}
