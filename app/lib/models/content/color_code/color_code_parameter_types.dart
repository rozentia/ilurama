// ignore_for_file: constant_identifier_names
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_code_parameter_types.freezed.dart';

///@ Parameter Type Key Names
const k_red = 'red';
const k_green = 'green';
const k_blue = 'blue';
const k_white = 'white';
const k_cyan = 'cyan';
const k_magenta = 'magenta';
const k_yellow = 'yellow';
const k_amber = 'amber';
const k_uv = 'uv';

@freezed
class ColorCodeParameterType with _$ColorCodeParameterType {
  const ColorCodeParameterType._();

  const factory ColorCodeParameterType.red() = ParameterRed;
  const factory ColorCodeParameterType.green() = ParameterGreen;
  const factory ColorCodeParameterType.blue() = ParameterBlue;
  const factory ColorCodeParameterType.white() = ParameterWhite;
  const factory ColorCodeParameterType.cyan() = ParameterCyan;
  const factory ColorCodeParameterType.magenta() = ParameterMagenta;
  const factory ColorCodeParameterType.yellow() = ParameterYellow;
  const factory ColorCodeParameterType.amber() = ParameterAmber;
  const factory ColorCodeParameterType.uv() = ParameterUV;

  /// Returns the parameterName string
  String get parameterTypeName => when<String>(
        red: () => k_red,
        green: () => k_green,
        blue: () => k_blue,
        white: () => k_white,
        cyan: () => k_cyan,
        magenta: () => k_magenta,
        yellow: () => k_yellow,
        amber: () => k_amber,
        uv: () => k_uv,
      );

  /// UI Label color of the item
  Color get color => when<Color>(
        red: () => const Color.fromARGB(255, 208, 44, 38), // ColorPalette.fireEngineRed,
        green: () => const Color.fromARGB(255, 88, 214, 43), // ColorPalette.kellyGreen,
        blue: () => const Color.fromARGB(255, 2, 116, 158), // ColorPalette.allPorts,
        white: () => const Color.fromARGB(255, 255, 255, 255), // Colors.white,
        cyan: () => const Color.fromARGB(255, 141, 255, 205), // ColorPalette.turquoise,
        magenta: () => const Color.fromARGB(255, 225, 52, 193), // ColorPalette.razzleDazzleRose,
        yellow: () => const Color.fromARGB(255, 254, 193, 66), // ColorPalette.pastelOrange,
        amber: () => const Color.fromARGB(255, 201, 112, 8), // ColorPalette.indochine,
        uv: () => const Color.fromARGB(255, 106, 26, 235), // ColorPalette.hanPurple,
      );

  /// Returns a List of all available types
  static List<ColorCodeParameterType> get allTypesAvailable => [
        const ColorCodeParameterType.red(),
        const ColorCodeParameterType.green(),
        const ColorCodeParameterType.blue(),
        const ColorCodeParameterType.white(),
        const ColorCodeParameterType.cyan(),
        const ColorCodeParameterType.magenta(),
        const ColorCodeParameterType.yellow(),
        const ColorCodeParameterType.amber(),
        const ColorCodeParameterType.uv(),
      ];
}

const k_raw_parm_red = ColorCodeParameterType.red();
const k_raw_parm_green = ColorCodeParameterType.green();
const k_raw_parm_blue = ColorCodeParameterType.blue();
const k_raw_parm_white = ColorCodeParameterType.white();
const k_raw_parm_cyan = ColorCodeParameterType.cyan();
const k_raw_parm_magenta = ColorCodeParameterType.magenta();
const k_raw_parm_yellow = ColorCodeParameterType.yellow();
const k_raw_parm_amber = ColorCodeParameterType.amber();
const k_raw_parm_uv = ColorCodeParameterType.uv();

extension ExtendedColorCodeParameterTypeList on List<ColorCodeParameterType> {
  /// Returns the ColorCodeParameterType not present in the list
  List<ColorCodeParameterType> get getMissing {
    List<ColorCodeParameterType> list = [];
    for (var type in ColorCodeParameterType.allTypesAvailable) {
      if (!contains(type)) list = [...list, type];
    }
    return list;
  }

  /// Returns true if the list contains <T>
  bool has<T>() {
    bool result = false;
    for (final i in this) {
      if (i is T) {
        result = true;
        break;
      }
    }
    return result;
  }
}
