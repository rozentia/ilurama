import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class RelatedScenesBlock extends StatelessWidget {
  final List<Scene> relatedScenes;
  const RelatedScenesBlock(
    this.relatedScenes, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SceneRow extends StatelessWidget {
  const SceneRow(this.doc, {Key? key}) : super(key: key);

  final Scene doc;

  @override
  Widget build(BuildContext context) {
    return IluramaTableRow(
      key: Key(doc.id),
      title: doc.title,
      subtitleText: doc.description,
      leading: const Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: CodedColorRepresentation(
          Colors.white,
          hideCode: true,
          size: 35,
        ),
      ),
    );
  }
}
