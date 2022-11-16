import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ilurama_theme/ilurama_theme.dart';

class ColorCodeParameterInfoModalView extends StatelessWidget {
  const ColorCodeParameterInfoModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: Icon(
            CupertinoIcons.xmark_circle,
            color: IluramaColors.critical.from(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Color Code Parameters'.asHeadline2(context),
            const SizedBox(height: 20),
            Flexible(
              child: Markdown(
                  styleSheet: MarkdownStyleSheet.fromTheme(
                      context.isLight ? IluramaTheme.material_light : IluramaTheme.material_dark),
                  data: '''
**An LED Color is the combination of a set of numeric parameters that are converted to a color.**
` `  
` `  
# Color Parameters
For a color code to work you need to set all parameters involved in generating the color. Most fixtures work with RGB or CMY parameters with optional White/Brightness or Warm/Cool custom parameters.
# Parameter Values              
The values of these parameters can be specified either as a percentage ranging from 0.0 to 100.0, or as a DMX value ranging from 0 to 255.
# Bit Depth              
The parameter values can have a depth of 8bit or 16bit. When the value is 8bit there is only one DMX value to specify, and when the value is 16bit there are two DMX values to specify commonly known as coarse and fine.'''),
            ),
          ],
        ),
      ),
    );
  }
}
