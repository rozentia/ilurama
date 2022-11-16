import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../entities/color_item/color_item.dart';
import '../../widgets/widgets.dart';

class ItemRepresentationBlock extends StatelessWidget {
  final ColorItem item;
  const ItemRepresentationBlock(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: double.infinity,
        height: 170.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: item.type.when<Widget>(
            colorFilter: () => ColorFilterRepresentationExpanded(
              itemColor: item.color,
              itemCode: item.itemCode,
            ),
            diffusionFilter: () => DiffuseFilterRepresentation(
              item.color,
              item.itemCode,
              item.imageFileName,
              hideCode: true,
              expanded: true,
              borderRadius: 14,
            ),
            technicalFilter: () => TechnicalFilterRepresentation(
              item.color,
              item.itemCode,
              hideCode: true,
            ),
            glassFilter: () => GlassFilterRepresentation(
              item.color,
              item.itemCode,
              hideCode: true,
            ),
          ),
        ),
      ),
    );
  }
}
