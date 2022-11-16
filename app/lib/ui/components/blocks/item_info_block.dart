import 'package:dartz/dartz.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilurama/app/extensions/extensions.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

import '../../../entities/color_item/color_item.dart';
import '../../../models/models.dart';

class ItemInfoBlock extends StatelessWidget {
  final ColorItem item;
  final Option<Brand> brand;
  const ItemInfoBlock({
    Key? key,
    required this.item,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          if (item.isProduct)
            Row(
              children: [
                //= Code
                item.itemCode.asHeadline1(context),
                const Expanded(child: SizedBox()),
                //= Brand Logo
                brand.getOrEmptyWidget(
                  (brand) => SizedBox.fromSize(
                    size: const Size(100, 45),
                    child: SvgPicture.string(brand.logo, color: secondaryColor(context), height: 45),
                  ),
                ),
              ],
            ),
          //= Name
          Align(alignment: Alignment.centerLeft, child: item.name.asHeadline3(context)),
          //= Description
          Align(
            alignment: Alignment.topLeft,
            child: item.description.getOrEmptyWidget(
              (description) => Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  description,
                  style: subtitle1(context),
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
