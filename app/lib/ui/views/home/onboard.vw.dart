import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blur/blur.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilurama/app/routes/routes.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logging/logging.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:shared_extensions/shared_extensions.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator/locator.dart';
import '../../../services/auth/auth.dart';
import '../../widgets/widgets.dart';
import '../user/forms/email_signin.vw.dart';

const EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 25.0, vertical: 100);
const List<Shadow> textShadows = [Shadow(color: Colors.black38, blurRadius: 10)];

class OnboardContent {
  final String heading;
  final String content;
  final IconData? icon;
  final String imageAddress;
  final Widget? widget;

  OnboardContent({
    required this.heading,
    required this.content,
    this.icon,
    this.widget,
    required this.imageAddress,
  });
}

class OnboardView extends StatelessWidget {
  OnboardView({Key? key}) : super(key: key);

  int _getImageAspectRatio(BuildContext context) {
    final deviceAR = MediaQuery.of(context).size.aspectRatio;
    if (deviceAR <= 0.5) return 4;
    if (deviceAR >= 0.7) return 7;
    return 5;
  }

  final ValueNotifier<int> _currentPage = ValueNotifier(0);
  final ValueNotifier<int> _initialAnimationStart = ValueNotifier(0);
  final ValueNotifier<int> _secondaryAnimationStart = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final int imageARnumber = _getImageAspectRatio(context);

    final List<OnboardContent> onboardContent = [
      OnboardContent(
          heading: '',
          content: '',
          imageAddress: 'assets/images/app_images/diana_close_ar_${imageARnumber}_06.jpg',
          widget: ValueListenableBuilder<int>(
              valueListenable: _initialAnimationStart,
              builder: (context, value, widget) {
                return Padding(
                  padding: contentPadding.copyWith(bottom: 0),
                  child: TweenAnimationBuilder<double>(
                      tween: value == 0 ? Tween<double>(begin: 30, end: 30) : Tween<double>(begin: 30, end: 0),
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastLinearToSlowEaseIn,
                      builder: (context, value, _) {
                        final double opacityValue = (value * -1).mapToRange(-30, 0, 0.0, 1.0);
                        final double logoPadding = value.mapToRange(0, 30, 130, 250);
                        final double sloganPadding = (value * -1).mapToRange(-30, 0, 20, 70);
                        return Opacity(
                          opacity: opacityValue,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: logoPadding),
                                child: SvgPicture.string(
                                  iluramaLogoType,
                                  color: Colors.white,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: sloganPadding),
                                child: SvgPicture.string(sloganSVG, color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              })),
      OnboardContent(
        heading: 'onboard_heading_1'.tr(),
        content: 'onboard_content_1'.tr(),
        icon: LineIcons.swatchbook,
        imageAddress: 'assets/images/app_images/diana_close_ar_${imageARnumber}_00.jpg',
      ),
      OnboardContent(
        heading: 'onboard_heading_2'.tr(),
        content: 'onboard_content_2'.tr(),
        icon: LineIcons.suitcase,
        imageAddress: 'assets/images/app_images/diana_close_ar_${imageARnumber}_04.jpg',
      ),
      OnboardContent(
        heading: 'onboard_heading_3'.tr(),
        content: 'onboard_content_3'.tr(),
        icon: CupertinoIcons.arrowshape_turn_up_right, // LineIcons.share,
        imageAddress: 'assets/images/app_images/diana_close_ar_${imageARnumber}_05.jpg',
      ),
      OnboardContent(
          heading: '',
          content: '',
          imageAddress: 'assets/images/app_images/diana_close_ar_${imageARnumber}_03.jpg',
          widget: const OnboardSocialSignIn()),
    ];

    return CupertinoScaffold(
      body: ViewModelBuilder<OnboardViewModel>.reactive(
          viewModelBuilder: () => OnboardViewModel(controller, onboardContent.length),
          builder: (context, model, widget) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_initialAnimationStart.value == 0) _initialAnimationStart.value = 1;
              if (_secondaryAnimationStart.value == 0) {
                Future.delayed(
                  const Duration(milliseconds: 1500),
                  () => _secondaryAnimationStart.value = 1,
                );
              }
            });
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leadingWidth: 100,
                leading: Center(
                  child: ValueListenableBuilder<int>(
                      valueListenable: _secondaryAnimationStart,
                      builder: (context, value, _) {
                        return AnimatedOpacity(
                          opacity: value.toDouble(),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOutCirc,
                          child: CirclePageIndicator(
                              dotColor: Colors.grey.shade600,
                              selectedDotColor: Colors.white,
                              currentPageNotifier: _currentPage,
                              itemCount: onboardContent.length),
                        );
                      }),
                ),
                actions: [
                  ValueListenableBuilder<int>(
                      valueListenable: _secondaryAnimationStart,
                      builder: (context, value, _) {
                        return AnimatedOpacity(
                          opacity: value.toDouble(),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOutCirc,
                          child: IconButton(
                            onPressed: () => context.router.replace(const HomeRoute()),
                            icon: const Icon(
                              CupertinoIcons.chevron_right_circle,
                              color: IluramaColors.accentColor,
                            ),
                          ),
                        );
                      }),
                ],
              ),
              extendBodyBehindAppBar: true,
              body: Stack(
                children: [
                  TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 30, end: 0),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutQuad,
                      builder: (context, value, _) {
                        return Opacity(
                            opacity: (value * -1).mapToRange(-30, 0.0, 0.0, 1.0),
                            child: Image.asset(
                              onboardContent[0].imageAddress,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fitWidth,
                            ).blurred(blur: value, blurColor: Colors.transparent, colorOpacity: 0.0));
                      }),
                  ...onboardContent
                      .skip(1)
                      .toList()
                      .asMap()
                      .map(
                        (key, content) => MapEntry(
                          key,
                          Opacity(
                            opacity: model.imageOpacityValues.elementAt(key),
                            child: Image.asset(
                              onboardContent[key + 1].imageAddress,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      )
                      .values,
                  PageView(
                    controller: model.controller,
                    onPageChanged: (to) => _currentPage.value = to,
                    children: onboardContent.map((content) => content.widget ?? OnboardPage(content)).toList(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class OnboardViewModel extends BaseViewModel {
  int index = 0;
  final int contentLength;
  final PageController controller;
  OnboardViewModel(this.controller, this.contentLength) {
    controller.addListener(() => onControllerChange());
  }

  List<double> get imageOpacityValues => List<double>.filled(contentLength, 0.0)
      .asMap()
      .map((key, value) {
        if (controller.positions.isEmpty) return MapEntry(key, 0.0);
        if ((controller.page ?? 0) <= key) return MapEntry(key, 0.0);
        if ((controller.page ?? 0) >= key + 1) return MapEntry(key, 1.0);
        return MapEntry(key, (controller.page ?? 0).mapToRange(key.toDouble(), key + 1, 0.0, 1.0));
      })
      .values
      .toList();

  void onControllerChange() => notifyListeners();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class OnboardPage extends StatelessWidget {
  final OnboardContent data;
  final Widget? child;
  const OnboardPage(this.data, {Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: child ??
          Padding(
            padding: contentPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            if (data.icon != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Icon(data.icon, size: 70, color: Colors.white),
                              ),
                            Expanded(
                              child: AutoSizeText(
                                data.heading,
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxFontSize: 32,
                                minFontSize: 10,
                                style: headline3(context)
                                    .copyWith(fontWeight: FontWeight.w800, fontSize: 26, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FrostedBox(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (data.content.contains('\n'))
                              ...data.content.split('\n').map(
                                    (textLine) => Container(
                                      decoration: textLine != data.content.split('\n').last
                                          ? const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 0.5, color: Colors.white38),
                                              ),
                                            )
                                          : null,
                                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                                      height: 50 + 10 + 1,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          textLine,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: bodyText1(context).copyWith(
                                              fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.75)),
                                        ),
                                      ),
                                    ),
                                  )
                            else
                              Text(data.content, style: bodyText1(context).copyWith(color: Colors.white60)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class OnboardSocialSignIn extends StatelessWidget {
  const OnboardSocialSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardSocialSignInViewModel>.reactive(
      viewModelBuilder: () => OnboardSocialSignInViewModel(),
      builder: (context, model, widget) => Padding(
        padding: contentPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'text_thank_you'.tr(),
                        style: headline3(context).copyWith(fontSize: 32, color: Colors.white, shadows: textShadows),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'text_sign_in_now'.tr(),
                          style: bodyText1().copyWith(fontSize: 18, color: Colors.white, shadows: textShadows),
                        ),
                      ),
                    )
                  ],
                )),
            //W! Google Sign In Button
            GestureDetector(
              onTap: () => model
                  .startSocialSignIn(const AuthWithGoogle())
                  .then((_) => context.router.replace(const HomeRoute())),
              child: FrostedBox(
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                      color: Colors.white.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'text_sign_in_with_google'.tr(),
                          style: button().copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        SizedBox.square(
                          dimension: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.string(googleiluramaLogoType, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 1),
            //W! Apple Sign In Button
            SignInWithAppleBuilder(
              fallbackBuilder: (ctx) => const SizedBox(),
              builder: (context) {
                return GestureDetector(
                  onTap: () => model
                      .startSocialSignIn(const AuthWithApple())
                      .then((_) => context.router.replace(const HomeRoute())),
                  child: FrostedBox(
                    borderRadius: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'text_sign_in_with_apple'.tr(),
                            style: button().copyWith(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          SizedBox.square(
                              dimension: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SvgPicture.string(appleLogoDark),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 1),
            //W! SignIn/Up with email
            GestureDetector(
              onTap: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => const EmailSignInView(),
              ).then((_) => context.router.replace(const HomeRoute())),
              child: FrostedBox(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                    color: Colors.white.withOpacity(0.2)),
                child: SizedBox(
                  height: 50 + 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('sign_in_with_email'.tr(), style: button().copyWith(color: Colors.white)),
                      const SizedBox(width: 10),
                      const SizedBox.square(
                          dimension: 40,
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(CupertinoIcons.mail_solid, color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardSocialSignInViewModel extends BaseViewModel {
  final _log = Logger('UserViewModel');
  final AuthServiceInterface _authService;

  OnboardSocialSignInViewModel({AuthServiceInterface? authService})
      : _authService = authService ?? getIt<AuthServiceInterface>();

  Future<void> startSocialSignIn(AuthType authType) => runBusyFuture(
        _authService.handleSignIn(authType).then((failureOrUser) => failureOrUser.fold(
              //LOOSERROR unhandled
              (l) {
                _log.severe(l);
                setError(true);
              },
              (r) => setError(null),
            )),
      );
}
