import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:stacked/stacked.dart';

import 'post.vm.dart';

class PostItemView extends StatelessWidget {
  const PostItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      builder: (context, model, child) {
        return Container();
      },
      viewModelBuilder: () => PostViewModel(),
    );
  }
}
