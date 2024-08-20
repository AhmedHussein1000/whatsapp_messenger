import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: 'Read our',
            style: Styles.styleRegular16(context).copyWith(height: 1.5),
          ),
          TextSpan(
              text: ' Privacy Policy. ',
              style: Styles.styleRegular16(context).copyWith(
                  height: 1.5,
                  color: SizeConfig.isLight ? kblueLight : kblueDark)),
          TextSpan(
              text: ' Tap "Agree and Continue" to accept the ',
              style: Styles.styleRegular16(context).copyWith(height: 1.5)),
          TextSpan(
              text: 'Terms of Service.',
              style: Styles.styleRegular16(context)
                  .copyWith(color: SizeConfig.isLight ? kblueLight : kblueDark))
        ]),
      ),
    );
  }
}
