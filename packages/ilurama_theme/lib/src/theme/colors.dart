import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ThemeColor {
  final Color light;
  final Color dark;
  const ThemeColor(this.light, this.dark);

  /// Resolve color brightness by provided BuildContext
  Color from([BuildContext? context]) => context == null
      ? light
      : MediaQuery.maybeOf(context)?.platformBrightness == Brightness.dark
          ? dark
          : light;

  /// Resolve color brightness by provided Brightness
  Color of([Brightness? brightness]) => brightness == Brightness.dark ? dark : light;

  /// Returns inverted [brightness] color
  Color invertedOf(Brightness brightness) => brightness == Brightness.dark ? light : dark;
}

class SvgReplaceableColors {
  SvgReplaceableColors._();
  static const originalLight = Color.fromARGB(255, 211, 0, 141);
  static const originalDark = Color.fromARGB(255, 255, 44, 156);
}

class IluramaColors {
  IluramaColors._();

  /// Base color for application canvas:\
  /// blackHaze, mirage
  static const canvasColor = ThemeColor(
    ColorPalette.blackHaze,
    ColorPalette.mirage,
  );

  /// The lightest dark version over canvas color
  static const disabled = ThemeColor(
    ColorPalette.disabledLight,
    ColorPalette.disabledDark,
  );

  /// Shade for dividers and separators (lighter than secondary and darker than disabled)
  static const divider = ThemeColor(ColorPalette.dividerLight, ColorPalette.dividerDark);

  /// Color for barrier modals
  static const barrierModalColor = ThemeColor(
    ColorPalette.modalBarrierColorLight,
    ColorPalette.modalBarrierColorDark,
  );

  /// The base color for the frosting effect
  static const frost = ThemeColor(
    ColorPalette.frostLight,
    ColorPalette.frostDark,
  );

  /// Base fill color for large or accented size shapes
  static final secondarySystemFill = ThemeColor(
    ColorPalette.tertiarySystemFillLight.withOpacity(0.15),
    ColorPalette.tertiarySystemFillDark.withOpacity(0.15),
  );

  /// Base fill color for medium size shapes
  static const tertiarySystemFill = ThemeColor(
    ColorPalette.tertiarySystemFillLight,
    ColorPalette.tertiarySystemFillDark,
  );

  /// Neumorphic surface base color
  static const neumorphicBase = ThemeColor(
    ColorPalette.smoke,
    ColorPalette.charade,
  );

  /// Main color for actionable and highlighted\
  /// azure
  static const accentColor = ColorPalette.azure;

  /// Variant to use mixed with the accent color
  static const variantColor = ColorPalette.deepSkyBlue2;

  /// Color a contrasting with accent color:\
  /// white
  static const textOverAccent = Colors.white;

  /// Default text color used by the Neumorphic Theme
  static const primaryTextColor = ThemeColor(
    Colors.black, // ColorPalette.bunker,
    Colors.white, // ColorPalette.blackHaze,
  );

  /// Secondary (text) color for non primary, non actionable, non highlighted elements\
  static const secondaryColor = ThemeColor(
    ColorPalette.secondaryLight,
    ColorPalette.secondaryDark,
  );

  /// Alerts and warning elements
  static const warning = ThemeColor(
    ColorPalette.pizazz,
    ColorPalette.chardonnay,
  );

  /// Negative or destructive elements
  static const critical = ThemeColor(
    ColorPalette.fireEngineRed,
    ColorPalette.redOrange,
  );

  /// Contras color to place over critical color
  static const overCritical = Colors.white;

  /// Shades array (0 = lightest, 4 = darkest):\
  /// mirage, charade, dove grey, pale slate, zircon
  static const shades = [
    ColorPalette.mirage,
    ColorPalette.charade,
    ColorPalette.doveGrey,
    ColorPalette.paleSlate,
    ColorPalette.zircon,
  ];

  /// Affirmative elements
  static const ok = ColorPalette.paleGreen;

  /// Neutral elements
  static const neutral = ColorPalette.portage;

  /// Main branding gradient
  static const uiGradient = GradientPalette.gSalmon;

  /// Element colors
  // static const blue = ColorPalette.portage;
  // static const orange = ColorPalette.monaLisa;
  // static const violet = ColorPalette.lavenderIndigo;
  // static const yellow = ColorPalette.goldenRod;
  // static const pink = ColorPalette.brilliantLavender;
  // static const green = ColorPalette.paleGreen;
  // static const red = ColorPalette.fireEngineRed;

  /// List of color to use for elements
  static const uiColorList = [
    ColorPalette.portage,
    ColorPalette.monaLisa,
    ColorPalette.lavenderIndigo,
    ColorPalette.goldenRod,
    ColorPalette.brilliantLavender,
    ColorPalette.paleGreen,
    ColorPalette.heliotrope,
    ColorPalette.fireEngineRed,
  ];

  /// List of gradients to use for elements
  static const uiGradientList = GradientPalette.gradientsPale;
}

class ColorPalette {
  ColorPalette._();

  //- Default UI Shades
  static const secondaryLight = Color.fromRGBO(60, 60, 67, 0.6);
  static const secondaryDark = Color.fromRGBO(235, 235, 245, 0.6);
  static const disabledLight = Color.fromRGBO(116, 116, 128, 0.18);
  static const disabledDark = Color.fromRGBO(116, 116, 128, 0.08);
  static const frostLight = Color.fromRGBO(245, 245, 245, 0.6);
  static const frostDark = Color.fromRGBO(37, 42, 56, 0.6);
  // Color.fromRGBO(46, 46, 46, 0.6);
  // originals = 24 / 0.7 | 24 / 0.4
  static const dividerLight = Color.fromRGBO(60, 60, 67, 0.36);
  static const dividerDark = Color.fromRGBO(84, 84, 88, 0.65);
  static const modalBarrierColorLight = Color.fromRGBO(60, 60, 67, 0.6); // same as secondary light
  static const modalBarrierColorDark = Color.fromRGBO(22, 22, 25, 0.6);
  static const tertiarySystemFillLight = Color.fromARGB(30, 118, 118, 128);
  static const tertiarySystemFillDark = Color.fromARGB(61, 118, 118, 128);

  //- Base UI Shades
  static const black = Color.fromARGB(255, 0, 0, 0);
  static const mirage = Color.fromARGB(255, 25, 27, 37);
  static const charade = Color.fromARGB(255, 38, 42, 52);
  static const bunker = Color.fromARGB(255, 41, 43, 47);
  static const doveGrey = Color.fromARGB(255, 113, 113, 113);
  static const shadyLady = Color.fromARGB(255, 155, 156, 157);
  static const paleSlate = Color.fromARGB(255, 194, 193, 194);
  static const loblolly = Color.fromARGB(255, 195, 201, 208);
  static const zircon = Color.fromARGB(255, 222, 224, 236);
  static const smoke = Color.fromARGB(255, 235, 237, 239);
  static const blackHaze = Color.fromARGB(255, 246, 248, 249);
  static const white = Color.fromARGB(255, 255, 255, 255);

  //- Elements UI
  static const azure = Color.fromARGB(255, 0, 122, 255);
  static const deepSkyBlue2 = Color.fromARGB(255, 0, 206, 255);
  static const portage = Color.fromARGB(255, 142, 150, 255);
  static const monaLisa = Color.fromARGB(255, 255, 150, 142);
  static const lavenderIndigo = Color.fromARGB(255, 160, 106, 249);
  static const goldenRod = Color.fromARGB(255, 255, 222, 114);
  static const brilliantLavender = Color.fromARGB(255, 252, 164, 255);
  static const paleGreen = Color.fromARGB(255, 165, 245, 156);
  static const heliotrope = Color.fromARGB(255, 195, 96, 255);
  static const fireEngineRed = Color.fromARGB(255, 208, 44, 38);
  static const redOrange = Color.fromARGB(255, 255, 59, 47);
  static const pizazz = Color.fromARGB(255, 255, 149, 3);

  //- UI Gradient Colors
  static const brilliantRose = Color.fromARGB(255, 255, 79, 171);
  static const deepOrange = Color.fromARGB(255, 246, 59, 58);

  //- Pale Gradient Colors
  static const salmon = Color.fromARGB(255, 255, 135, 100);
  static const goldenGlow = Color.fromARGB(255, 255, 226, 148);

  static const aquamarine = Color.fromARGB(255, 90, 255, 201);
  static const mayaBlue = Color.fromARGB(255, 118, 198, 249);
  static const lavenderRose = Color.fromARGB(255, 244, 171, 234);

  static const deepSkyBlue = Color.fromARGB(255, 50, 174, 241);
  static const chardonnay = Color.fromARGB(255, 255, 204, 145);

  static const turquoise = Color.fromARGB(255, 141, 255, 205);
  static const unitedNationsBlue = Color.fromARGB(255, 75, 144, 237);

  static const shockingPink = Color.fromARGB(255, 255, 124, 255);
  static const magicMint = Color.fromARGB(255, 159, 249, 211);

  static const brightPink = Color.fromARGB(255, 247, 0, 117);
  static const brightUbe = Color.fromARGB(255, 205, 142, 255);

  //- Vibrant Gradient Colors
  static const milanoRed = Color.fromARGB(255, 166, 50, 50);
  static const coralRed = Color.fromARGB(255, 247, 59, 60);

  static const violetBlue = Color.fromARGB(255, 47, 74, 171);
  static const fountainBlue = Color.fromARGB(255, 90, 196, 192);

  static const indochine = Color.fromARGB(255, 201, 112, 8);
  static const indianYellow = Color.fromARGB(255, 225, 170, 85);

  static const daisyBush = Color.fromARGB(255, 74, 31, 171);
  static const veronica = Color.fromARGB(255, 159, 60, 237);

  static const allPorts = Color.fromARGB(255, 2, 116, 158);
  static const kellyGreen = Color.fromARGB(255, 88, 214, 43);

  static const hanPurple = Color.fromARGB(255, 106, 26, 235);
  static const bleuDeFrance = Color.fromARGB(255, 49, 133, 251);

  static const pastelOrange = Color.fromARGB(255, 254, 193, 66);
  static const sun = Color.fromARGB(255, 251, 139, 50);

  static const darkViolet = Color.fromARGB(255, 141, 10, 201);
  static const razzleDazzleRose = Color.fromARGB(255, 225, 52, 193);

  //- Ilurama Originals

  static const g_1_1 = Color(0xFFF093FB);
  static const g_1_2 = Color(0xFFF5576C);

  static const g_2_1 = Color(0xFF00F2FE);
  static const g_2_2 = Color(0xFF4FACFE);

  static const g_3_1 = Color(0xFF38F9D7);
  static const g_3_2 = Color(0xFF43E97B);

  static const g_4_1 = Color(0xFF007ADF);
  static const g_4_2 = Color(0xFF00ECBC);

  static const g_5_1 = Color(0xFF2AF598);
  static const g_5_2 = Color(0xFF009EFD);

  static const g_6_1 = Color(0xFFFA709A);
  static const g_6_2 = Color(0xFFFEE140);

  static const g_7_1 = Color(0xFFC79081);
  static const g_7_2 = Color(0xFFDFA579);

  static const g_8_1 = Color(0xFFBCC5CE);
  static const g_8_2 = Color(0xFF929EAD);

  static const g_9_1 = Color(0xFFFC00FF);
  static const g_9_2 = Color(0xFF00DBDE);

  static const g_10_1 = Color(0xFFFFFBD5);
  static const g_10_2 = Color(0xFFB20A2C);

  static const g_11_1 = Color(0xFFFFB75E);
  static const g_11_2 = Color(0xFFFDE677);

  static const g_12_1 = Color(0xFFF857A6);
  static const g_12_2 = Color(0xFFFF5858);

  static const g_13_1 = Color(0xFFE5B2CA);
  static const g_13_2 = Color(0xFF7028E4);

  static const g_14_1 = Color(0xFFFFB199);
  static const g_14_2 = Color(0xFFFF0844);

  static const g_15_1 = Color(0xFF13547A);
  static const g_15_2 = Color(0xFF80D0C7);

  static const g_16_1 = Color(0xFFD7D2CC);
  static const g_16_2 = Color(0xFF304352);
}

class GradientPalette {
  static const defaultGradient = gAquamarine;
  static const LinearGradient defaultCritical = LinearGradient(
    colors: [ColorPalette.brightPink, ColorPalette.fireEngineRed],
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
  );

  //- Ilurama Originals
  static const gradientsIlurama = [
    g_1,
    g_2,
    g_3,
    g_4,
    g_5,
    g_6,
    g_7,
    g_8,
    g_9,
    g_10,
    g_11,
    g_12,
    g_13,
    g_14,
    g_15,
    g_16,
  ];

  //- Pale Gradients
  static const gradientsPale = [
    gSalmon,
    gAquamarine,
    gChardonnay,
    gUnitedNations,
    gShockingPink,
    gBrightUbe,
    gBrilliantRose,
  ];

  static const LinearGradient g_1 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_1_1, ColorPalette.g_1_2],
  );

  static const LinearGradient g_2 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_2_1, ColorPalette.g_2_2],
  );

  static const LinearGradient g_3 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_3_1, ColorPalette.g_3_2],
  );

  static const LinearGradient g_4 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_4_1, ColorPalette.g_4_2],
  );

  static const LinearGradient g_5 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_5_1, ColorPalette.g_5_2],
  );

  static const LinearGradient g_6 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_6_1, ColorPalette.g_6_2],
  );

  static const LinearGradient g_7 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_7_1, ColorPalette.g_7_2],
  );

  static const LinearGradient g_8 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_8_1, ColorPalette.g_8_2],
  );

  static const LinearGradient g_9 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_9_1, ColorPalette.g_9_2],
  );

  static const LinearGradient g_10 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_10_1, ColorPalette.g_10_2],
  );

  static const LinearGradient g_11 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_11_1, ColorPalette.g_11_2],
  );

  static const LinearGradient g_12 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_12_1, ColorPalette.g_12_2],
  );

  static const LinearGradient g_13 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_13_1, ColorPalette.g_13_2],
  );

  static const LinearGradient g_14 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_14_1, ColorPalette.g_14_2],
  );

  static const LinearGradient g_15 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_15_1, ColorPalette.g_15_2],
  );

  static const LinearGradient g_16 = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.g_16_1, ColorPalette.g_16_2],
  );

  static const LinearGradient gSalmon = LinearGradient(
    end: Alignment.bottomRight,
    colors: [ColorPalette.salmon, ColorPalette.goldenGlow],
  );

  static const LinearGradient gAquamarine = LinearGradient(
    begin: Alignment(-1.04, -1.5),
    end: Alignment(-1.01, 2.0),
    colors: [ColorPalette.aquamarine, ColorPalette.mayaBlue, ColorPalette.lavenderRose],
  );

  static const LinearGradient gChardonnay = LinearGradient(
    begin: Alignment(-0.01, -1.0),
    end: Alignment(0.02, 1.5),
    colors: [ColorPalette.chardonnay, ColorPalette.deepSkyBlue],
  );

  static const LinearGradient gUnitedNations = LinearGradient(
    begin: Alignment(-0.02, -1.6),
    end: Alignment(0.02, 2.5),
    colors: [ColorPalette.turquoise, ColorPalette.unitedNationsBlue],
  );

  static const LinearGradient gShockingPink = LinearGradient(
    begin: Alignment(0.02, -1.4),
    end: Alignment(-0.02, 2.8),
    colors: [ColorPalette.magicMint, ColorPalette.shockingPink],
  );

  static const LinearGradient gBrightUbe = LinearGradient(
    begin: Alignment(0.02, -1.4),
    end: Alignment(-0.02, 2.8),
    colors: [ColorPalette.brightUbe, ColorPalette.brightPink],
  );

  static const LinearGradient gBrilliantRose = LinearGradient(
    begin: Alignment(0.02, -0.4),
    end: Alignment(-0.02, 2.8),
    colors: [ColorPalette.brilliantRose, ColorPalette.deepOrange],
  );

  //- Vibrant Gradients
  static const gradientsVibrant = [
    gVibrantRed,
    gVibrantAqua,
    gYellow,
    gPurple,
    gGreen,
    gPlum,
    gOrange,
    gOrange,
    gPink,
  ];
  static const gVibrantRed = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.milanoRed, ColorPalette.coralRed],
  );
  static const gVibrantAqua = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.violetBlue, ColorPalette.fountainBlue],
  );
  static const gYellow = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.indochine, ColorPalette.indianYellow],
  );
  static const gPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.daisyBush, ColorPalette.veronica],
  );
  static const gGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.allPorts, ColorPalette.kellyGreen],
  );
  static const gPlum = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.hanPurple, ColorPalette.bleuDeFrance],
  );
  static const gOrange = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.pastelOrange, ColorPalette.sun],
  );
  static const gPink = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    colors: [ColorPalette.darkViolet, ColorPalette.razzleDazzleRose],
  );

  /// Gradient List
  static List<LinearGradient> gradientAll = [
    ...gradientsPale,
    ...gradientsVibrant,
  ];
}
