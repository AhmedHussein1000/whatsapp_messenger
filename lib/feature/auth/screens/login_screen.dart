import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';
import 'package:whatsapp_messenger/feature/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Enter your phone number',
          style: Styles.styleSemiBold18(context).copyWith(
              color: SizeConfig.isLight ? kgreenLight : kAuthAppbarTextDark),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //TODO more settings
              },
              icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'WhatsApp will need to verify your phone number.\n',
                      style: Styles.styleRegular16(context)),
                  TextSpan(
                      text: 'What\'s my number?',
                      style: Styles.styleRegular16(context).copyWith(
                          height: 1.5,
                          color: SizeConfig.isLight ? kblueLight : kblueDark)),
                ])),
            const SizedBox(
              height: 20,
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
