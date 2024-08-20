import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/helpers/extensions.dart';
import 'package:whatsapp_messenger/core/helpers/routes.dart';
import 'package:whatsapp_messenger/core/utils/assets.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';
import 'package:whatsapp_messenger/feature/welcome/widgets/language_button.dart';
import 'package:whatsapp_messenger/feature/welcome/widgets/privacy_and_terms.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                Assets.imagesCircle,
                color: SizeConfig.isLight ? kgreenLight : kgreenDark,
                height: SizeConfig.screenHeight * 0.35,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
              child: Column(
            children: [
              Text(
                'Welcome to WhatsApp',
                style: Styles.styleExtraBold24(context),
              ),
              const SizedBox(
                height: 20,
              ),
              const TermsAndPrivacy(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10)),
                    onPressed: () {
                      context.pushReplacementNamed(Routes.login);
                    },
                    child: Text(
                      'Agree and Continue',
                      style: Styles.styleBold20(context),
                    )),
              ),

              
              const SizedBox(height: 50),
              const LanguageButton()
            ],
          )),
        ],
      )),
    );
  }
}
