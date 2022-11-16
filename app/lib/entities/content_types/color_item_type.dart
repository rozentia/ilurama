import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_item_type.freezed.dart';

@freezed
class ColorItemType with _$ColorItemType {
  const ColorItemType._();

  const factory ColorItemType.colorFilter() = ColorFilter;
  const factory ColorItemType.diffusionFilter() = DiffusionFilter;
  const factory ColorItemType.technicalFilter() = TechnicalFilter;
  const factory ColorItemType.glassFilter() = GlassFilter;

  static List<ColorItemType> get all => [
        const ColorFilter(),
        const DiffusionFilter(),
        const TechnicalFilter(),
        const GlassFilter(),
      ];
}

extension ColorItemTypeX on ColorItemType {
  String get typeLabel => when<String>(
        colorFilter: () => 'title_color_filter'.tr(),
        diffusionFilter: () => 'title_diffusion_filter'.tr(),
        technicalFilter: () => 'title_technical_filter'.tr(),
        glassFilter: () => 'title_glass_filter'.tr(),
      );
}
