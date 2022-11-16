import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 100),
        child: FutureBuilder<String>(
          future: rootBundle.loadString('assets/docs/privacy.md').catchError((e) => 'Privacy Policy'),
          builder: (context, snapshot) => snapshot.hasData
              ? Markdown(data: snapshot.data ?? 'Privacy Policy')
              : const CupertinoActivityIndicator(radius: 48),
        ),
      ),
    );
  }
}
