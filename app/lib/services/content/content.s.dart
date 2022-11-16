import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flamingo/flamingo.dart' hide Collection;
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';

import '../../app/extensions/extensions.dart';
import '../../entities/color_item/color_item.dart';
import '../../entities/content_types/content_types.dart';
import '../../entities/extensions/extensions.dart';
import '../../entities/filter_settings/filter_settings.dart';
import '../../models/models.dart';
import '../auth/auth.i.dart';
import '../library/library.dart';
import 'content.i.dart';

final _log = Logger('ContentService');

@Singleton(as: ContentServiceInterface, dependsOn: [AuthServiceInterface, LibraryServiceInterface])
class ContentService with ReactiveServiceMixin implements ContentServiceInterface {
  final LibraryServiceInterface _libraryService;
  final ReactiveValue<LibraryFilterSettings> _libraryFilterSettings =
      ReactiveValue<LibraryFilterSettings>(LibraryFilterSettings.clear());
  final ReactiveValue<CollectionFilterSettings> _collectionFilterSettings =
      ReactiveValue<CollectionFilterSettings>(CollectionFilterSettings.clear());
  final ReactiveValue<SceneFilterSettings> _sceneFilterSettings =
      ReactiveValue<SceneFilterSettings>(SceneFilterSettings.clear());
  final ReactiveValue<String?> _currentUserId = ReactiveValue<String?>(null);

  ContentService(this._libraryService, FirebaseAuth firebaseAuth) {
    _log.fine('Initializing ContentService from main constructor');
    listenToReactiveValues([
      _libraryFilterSettings,
      _currentUserId,
      _rUserCollections,
      _rUserColorCodes,
      _rUserScenes,
    ]);

    firebaseAuth.authStateChanges().listen((maybeUser) => _currentUserId.value = maybeUser?.uid);
    _currentUserId.listen((userId) => userId == null ? _deflate() : _inflate());
    _log.fine('ContentService initialized');
  }

  @override
  String? get currentUserUid => _currentUserId.value;

  @override
  Map<String, String> get availableBranches =>
      Set.of(_libraryService.products.map((product) => product.branch).toList().toNonNull).toList().asMap().map(
            (index, branchName) => MapEntry(
              branchName,
              _libraryService.products
                  .firstWhere(
                    (product) => product.branch == branchName,
                    orElse: () => Product.unknown(),
                  )
                  .brand,
            ),
          );

  @override
  List<String> get availableBrands => _libraryService.brands.map((e) => e.name).toList();

  @override
  List<ColorItemType> get availableTypes => ColorItemType.all;

  //- Color Codes
  ///@ If authenticated contains all user's color code items
  List<ColorCode>? _userColorCodes;

  final ReactiveValue<List<ColorCode>> _rUserColorCodes = ReactiveValue([]);
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _colorCodesListener;

  @override
  List<ColorCode> get allUserColorCodes => _rUserColorCodes.value;

  ///@ Query subscription for user's color code items
  // StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _userColorCodeSubscription;

  @override
  List<ColorItem> get displayableColorItems => [
        ..._libraryService.products.map((p) => ColorItem.fromProduct(p)),
        if (_userColorCodes != null) ..._userColorCodes!.map((colorCode) => ColorItem.fromColorCode(colorCode))
      ].toList().applyLibraryFilter(_libraryFilterSettings.value);
  @override
  LibraryFilterSettings get libraryFilterSettings => _libraryFilterSettings.value;
  @override
  void updateLibraryFilterSettings(LibraryFilterSettings newSettings) => _libraryFilterSettings.value = newSettings;

  //- Collections
  final ReactiveValue<List<Collection>> _rUserCollections = ReactiveValue([]);
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _collectionListener;

  @override
  List<Collection> get allUserCollections => _rUserCollections.value;

  @override
  // FFEATURE implement displayableCollections
  List<Collection> get displayableCollections => throw UnimplementedError();

  @override
  CollectionFilterSettings get collectionFilterSettings => _collectionFilterSettings.value;

  @override
  void updateCollectionFilterSettings(CollectionFilterSettings newSettings) =>
      _collectionFilterSettings.value = newSettings;

  //- Scenes
  final ReactiveValue<List<Scene>> _rUserScenes = ReactiveValue([]);
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _scenesListener;

  @override
  List<Scene> get allUserScenes => _rUserScenes.value;

  @override
  // FFEATURE implement userDisplayableScenes
  List<Scene> get userDisplayableScenes => throw UnimplementedError();

  @override
  // FFEATURE implement streamOfScenes
  List<Scene> get streamOfScenes => throw UnimplementedError();

  @override
  SceneFilterSettings get sceneFilterSettings => _sceneFilterSettings.value;
  @override
  void updateSceneFilterSettings(SceneFilterSettings newSettings) => _sceneFilterSettings.value = newSettings;

  //-                                                                              HELPERS

  ///@ Clears all content related stuff from memory (this function is registered to listen to _authenticated reactive value of AuthService)
  Future<void> _deflate() async {
    await _collectionListener?.cancel();
    await _colorCodesListener?.cancel();
    await _scenesListener?.cancel();
  }

  ///@ Loads all content related stuff in memory (this function is registered to listen to _authenticated reactive value of AuthService)
  Future<void> _inflate() async {
    //= Set user collection listener
    _collectionListener = firestoreInstance
        .collection(Document.path<Collection>())
        .where('owner', isEqualTo: currentUserUid)
        .snapshots()
        .listen((querySnapshot) {
      _rUserCollections.value = querySnapshot.docs.map((snapshot) => Collection(snapshot: snapshot)).toList();
    });
    //= Set user color codes listener
    _colorCodesListener = firestoreInstance
        .collection(Document.path<ColorCode>())
        .where('owner', isEqualTo: currentUserUid)
        .snapshots()
        .listen((querySnapshot) {
      _rUserColorCodes.value = querySnapshot.docs.map((snapshot) => ColorCode(snapshot: snapshot)).toList();
    });
    //= Set user scenes listener
    _scenesListener = firestoreInstance
        .collection(Document.path<Scene>())
        .where('owner', isEqualTo: currentUserUid)
        .snapshots()
        .listen((querySnapshot) {
      _rUserScenes.value = querySnapshot.docs.map((snapshot) => Scene(snapshot: snapshot)).toList();
    });
  }
}
