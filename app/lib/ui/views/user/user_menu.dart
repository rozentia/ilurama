import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ilurama_theme/ilurama_theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiredash/wiredash.dart';

import 'privacy.vw.dart';
import 'user.vm.dart';

enum UserMenuOptions {
  contactSupport,
  shareFeedback,
  showPrivacy,
  showTerms,
  requestDeletion,
}

class UserMenu extends StatelessWidget {
  const UserMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        //W! - Support
        ListTile(
          leading: const Icon(LineIcons.lifeRing),
          onTap: () => context.router.pop(UserMenuOptions.contactSupport),
          title: Text('btn_support'.tr()),
        ),
        //W! - Feedback
        ListTile(
          leading: const Icon(CupertinoIcons.ellipses_bubble),
          onTap: () => context.router.pop(UserMenuOptions.shareFeedback),
          title: Text('btn_share_feedback'.tr()),
        ),
        //W! - Privacy
        ListTile(
          leading: const Icon(CupertinoIcons.lock_shield),
          onTap: () => context.router.pop(UserMenuOptions.showPrivacy),
          title: Text('title_privacy'.tr()),
        ),
        //W! - Terms
        ListTile(
          leading: const Icon(CupertinoIcons.doc_plaintext),
          onTap: () => context.router.pop(UserMenuOptions.showTerms),
          //TRANSLATE -
          title: const Text('Terms of Service'),
        ),
        //W! - Request Deletion
        ListTile(
          leading: const Icon(CupertinoIcons.person_crop_circle_badge_xmark),
          onTap: () => context.router.pop(UserMenuOptions.requestDeletion),
          //TRANSLATE -
          title: const Text('Request Account Deletion'),
        ),
        //W! - Footer
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Center(
              child: Text(
                'Ilurama App version 1.0\n© 2022 Misfitcoders',
                style: overline(context).copyWith(color: IluramaColors.secondaryColor.from(context)),
              ),
            ))
      ],
    );
  }
}
