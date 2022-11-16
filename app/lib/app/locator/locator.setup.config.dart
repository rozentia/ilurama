// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flamingo/flamingo.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../../services/analytics/analytics.s.dart' as _i3;
import '../../services/auth/auth.i.dart' as _i14;
import '../../services/auth/auth.s.dart' as _i15;
import '../../services/config/config.i.dart' as _i16;
import '../../services/config/config.s.dart' as _i17;
import '../../services/content/content.i.dart' as _i18;
import '../../services/content/content.s.dart' as _i19;
import '../../services/library/library.dart' as _i20;
import '../../services/library/library.i.dart' as _i8;
import '../../services/library/library.s.dart' as _i9;
import '../../services/user/user.i.dart' as _i12;
import '../../services/user/user.s.dart' as _i13;
import 'modules.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.AnalyticsService>(() => _i3.AnalyticsService());
  gh.lazySingleton<_i4.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i4.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i5.FirebaseAuth>(
      () => thirdPartyServicesModule.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseFirestore>(
      () => thirdPartyServicesModule.firebaseFirestore);
  gh.lazySingleton<_i6.FirebaseStorage>(
      () => thirdPartyServicesModule.firebaseStorage);
  gh.lazySingleton<_i6.Flamingo>(() => thirdPartyServicesModule.flamingo);
  gh.lazySingleton<_i7.GoogleSignIn>(
      () => thirdPartyServicesModule.googleSignIn);
  gh.singletonAsync<_i8.LibraryServiceInterface>(
    () => _i9.LibraryService.init(),
    signalsReady: false,
  );
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => thirdPartyServicesModule.preferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.SignInWithApple>(
      () => thirdPartyServicesModule.signInWithApple);
  gh.lazySingleton<_i4.SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  gh.singletonAsync<_i12.UserServiceInterface>(
    () => _i13.UserService.init(get<_i5.FirebaseAuth>()),
    signalsReady: false,
  );
  gh.singletonAsync<_i14.AuthServiceInterface>(
    () => _i15.AuthService.init(
      get<_i5.FirebaseAuth>(),
      get<_i7.GoogleSignIn>(),
      get<_i11.SignInWithApple>(),
      get<_i3.AnalyticsService>(),
    ),
    signalsReady: false,
  );
  gh.singletonAsync<_i16.ConfigServiceInterface>(
    () => _i17.ConfigService.init(get<_i10.SharedPreferences>()),
    signalsReady: false,
  );
  gh.singletonWithDependencies<_i18.ContentServiceInterface>(
    () => _i19.ContentService(
      get<_i20.LibraryServiceInterface>(),
      get<_i5.FirebaseAuth>(),
    ),
    dependsOn: [
      _i14.AuthServiceInterface,
      _i20.LibraryServiceInterface,
    ],
  );
  return get;
}

class _$ThirdPartyServicesModule extends _i21.ThirdPartyServicesModule {
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackbarService => _i4.SnackbarService();
}
