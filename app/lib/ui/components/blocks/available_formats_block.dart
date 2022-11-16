import 'package:easy_localization/easy_localization.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../models/models.dart';

class AvailableFormatsBlock extends StatelessWidget {
  final List<ProductFormat> availableFormats;
  const AvailableFormatsBlock(
    this.availableFormats, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(children: [
        'title_available_formats'.tr().asSectionHeader,
        ...availableFormats
            .map((format) => IluramaTableRow(
                  key: Key('${format.label}-${format.type}'),
                  title: format.label,
                  subtitleText: format.type,
                ))
            .toList()
      ]),
    );
  }
}
