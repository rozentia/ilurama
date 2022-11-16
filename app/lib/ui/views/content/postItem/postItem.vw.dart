import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import 'postItem.vm.dart';

class PostItemEditorView extends StatelessWidget {
  const PostItemEditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostItemViewModel>.reactive(
      builder: (context, model, child) {
        return Container();
      },
      viewModelBuilder: () => PostItemViewModel(),
    );
  }
}
