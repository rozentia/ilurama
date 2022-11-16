import 'package:dartz/dartz.dart';
import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../../app/locator/locator.dart';
import '../../../../models/models.dart';
import '../../../../services/content/content.dart';

enum InputMode { percent, dmx }

final equals = const ListEquality().equals;

class ColorCodeParameterInterface {
  final ColorCodeParameter parameter;
  final bool error;
  ColorCodeParameterInterface(this.parameter, {this.error = false});

  ColorCodeParameterInterface copyWithType(ColorCodeParameterType newType, {bool? withError}) =>
      ColorCodeParameterInterface(
        parameter.copyWithType(newType),
        error: withError ?? error,
      );
  ColorCodeParameterInterface copyWithParameter(ColorCodeParameter newParameter, {bool? withError}) =>
      ColorCodeParameterInterface(
        newParameter,
        error: withError ?? error,
      );
  ColorCodeParameterInterface copyWithError(bool error) => ColorCodeParameterInterface(parameter, error: error);
}

class ColorCodeFormViewModel extends ReactiveViewModel {
  final log = Logger('CollectionFormViewModel');
  final ContentServiceInterface _contentService;
  final ColorCode? _colorCodeToEdit;

  ColorCodeFormViewModel({
    ContentService? contentService,
    ColorCode? colorCodeToEdit,
  })  : _contentService = contentService ?? getIt<ContentServiceInterface>(),
        _colorCodeToEdit = colorCodeToEdit {
    _name = _colorCodeToEdit?.name;
    _description = _colorCodeToEdit?.description;
    _hex = _colorCodeToEdit?.hex;

    final List<ColorCodeParameter> parametersList = _colorCodeToEdit?.parameters ?? <ColorCodeParameter>[];
    _activeParametersInterfaceNotifiers = parametersList
        .map(
          (e) => ValueNotifier<ColorCodeParameterInterface>(ColorCodeParameterInterface(e))
            ..addListener(_internalParameterListener),
        )
        .toList();
    unsusedColorCodeParameterTypesNotifier = ValueNotifier(parametersList.parameterTypes.getMissing);
    resolvedHex = ValueNotifier(_hex ??
        optionOf(parametersList.resolvedColor)
            .fold(() => null, (c) => '#${TinyColor.fromColor(c).toHex8().substring(2)}'));
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _contentService as ReactiveServiceMixin,
      ];

  List<String> get inputModes => ['%', '#'];
  InputMode get selectedInputMode => _selectedInputMode;
  late InputMode _selectedInputMode = InputMode.percent;
  void toggleInputMode() {
    _selectedInputMode = _selectedInputMode == InputMode.percent ? InputMode.dmx : InputMode.percent;
    notifyListeners();
  }

  String? _name;
  String? _description;
  String? _hex;

  late List<ValueNotifier<ColorCodeParameterInterface>> _activeParametersInterfaceNotifiers;
  List<ValueNotifier<ColorCodeParameterInterface>> get activeParametersInterfaceNotifiers =>
      _activeParametersInterfaceNotifiers;
  List<ColorCodeParameter> get activeParameters =>
      activeParametersInterfaceNotifiers.map((e) => e.value.parameter).toList();
  List<ColorCodeParameterType> get _activeParameterTypes => activeParameters.parameterTypes;
  bool get activeParametersInterfaceHasError =>
      _activeParametersInterfaceNotifiers.map<bool>((e) => e.value.error).contains(true);

  late final ValueNotifier<List<ColorCodeParameterType>> unsusedColorCodeParameterTypesNotifier;

  late final ValueNotifier<String?> resolvedHex;

  void refreshResolvedColor() {
    resolvedHex.value = optionOf(activeParameters.resolvedColor)
        .fold(() => null, (c) => '#${TinyColor.fromColor(c).toHex8().substring(2)}');
  }

  String? get colorCodeName => _name;
  String? get colorCodeDescription => _description;

  void onChangeName(String newName) {
    _name = newName;
    if (hasErrorForKey(validationErrorKey)) {
      notifyListeners();
    }
  }

  void refreshParameterInterfaceList() {
    if (!equals(unsusedColorCodeParameterTypesNotifier.value, _activeParameterTypes.getMissing)) {
      unsusedColorCodeParameterTypesNotifier.value = _activeParameterTypes.getMissing;
    }
  }

  void _internalParameterListener() {
    refreshParameterInterfaceList();
    refreshResolvedColor();
  }

  void onCreateParameter() {
    refreshParameterInterfaceList();
    if (unsusedColorCodeParameterTypesNotifier.value.isEmpty) return;
    _activeParametersInterfaceNotifiers.add(
      ValueNotifier(
        ColorCodeParameterInterface(
          ColorCodeParameter.fromParameterType(unsusedColorCodeParameterTypesNotifier.value.first),
        ),
      )..addListener(_internalParameterListener),
    );
    refreshParameterInterfaceList();
    notifyListeners();
  }

  void deleteParameter(int at) {
    _activeParametersInterfaceNotifiers.elementAt(at).dispose();
    _activeParametersInterfaceNotifiers.removeAt(at);
    notifyListeners();
  }

  void onChangeDescription(String newDescription) => _description = newDescription;

  //-_                                                      FORM VALIDATION AND SUBMISSION
  bool get titleValid => _name?.isNotEmpty ?? false;
  bool get parametersValid => !activeParametersInterfaceHasError;
  bool get hexValid => activeParameters.resolvedColor is Color && resolvedHex.value != null;
  String get validationErrorKey => 'hasValidationErrors';
  String get unknownErrorKey => 'hasUnknownError';

  Future<bool> onSubmit() async {
    if (!titleValid || !parametersValid || !hexValid) {
      setErrorForObject(validationErrorKey, validationErrorKey);
      notifyListeners();
      return false;
    } else {
      setError(null);
    }

    try {
      setBusy(true);
      if (_colorCodeToEdit != null) {
        await DocumentAccessor().update(_colorCodeToEdit!
          ..name = _name
          ..description = _description
          ..hex = resolvedHex.value ?? _hex
          ..parameters = activeParameters);
      } else {
        await DocumentAccessor().save(ColorCode(
          owner: _contentService.currentUserUid,
          name: _name,
          description: _description,
          hex: resolvedHex.value ?? _hex,
          parameters: activeParameters,
        ));
      }
      setBusy(false);
      return true;
    } catch (e) {
      log.severe(e);
      setErrorForObject(unknownErrorKey, e);
      //LOOSERROR unhandled
      return false;
    }
  }

  Future<bool> deleteColorCode() async {
    if (_colorCodeToEdit == null) return false;
    try {
      await DocumentAccessor().delete(_colorCodeToEdit!);
    } catch (e) {
      //LOOSERROR unhandled
      setError(e);
      return false;
    }
    return true;
  }
}

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<SliverAnimatedListState> listKey;
  final Widget Function(int item, BuildContext context, Animation<double> animation) removedItemBuilder;
  final List<E> _items;

  SliverAnimatedListState get _animatedList => listKey.currentState!;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
        index,
        (BuildContext context, Animation<double> animation) => removedItemBuilder(index, context, animation),
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}
