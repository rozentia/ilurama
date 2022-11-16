import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../models/models.dart';

class TransmissionColumn extends StatelessWidget {
  final TransmissionData data;
  const TransmissionColumn(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 2);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        (data.source ?? 'Source A').asSectionHeader,
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Y:  ',
                      style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
                  separator,
                  Text('x / y:  ',
                      style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
                  separator,
                  Text('abs:  ',
                      style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (data.Y?.toStringAsFixed(1) ?? ' ').asButton(context),
                  separator,
                  ('${data.x?.toStringAsFixed(1) ?? ' '} / ${data.y?.toStringAsFixed(1) ?? ' '}').asButton(context),
                  separator,
                  (data.absortion?.toStringAsFixed(1) ?? ' ').asButton(context),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TransmissionColumnCompact extends StatelessWidget {
  final List<TransmissionData> data;

  const TransmissionColumnCompact(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 2);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 15),
              Text('Y:  ',
                  style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
              separator,
              Text('x:  ',
                  style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
              separator,
              Text('y:  ',
                  style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
              separator,
              Text('abs:  ',
                  style: button(context).copyWith(color: secondaryColor(context), fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        ...data
            .map((d) => Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 15,
                            child: Text(
                              (d.source ?? 'Source A').toUpperCase(),
                              style: caption(context).copyWith(fontSize: 10, color: secondaryColor(context)),
                            )),
                        (d.Y?.toStringAsFixed(1) ?? ' ').asBodyText1(context),
                        separator,
                        (d.x?.toStringAsFixed(1) ?? ' ').asBodyText1(context),
                        (d.y?.toStringAsFixed(1) ?? ' ').asBodyText1(context),
                        separator,
                        (d.absortion?.toStringAsFixed(1) ?? ' ').asBodyText1(context),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
