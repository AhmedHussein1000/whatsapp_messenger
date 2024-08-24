import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';
import 'package:whatsapp_messenger/feature/auth/widgets/custom_textfield.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Verify your number',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            'You\'ve tried to register ${widget.phoneNumber} before requesting an SMS message with your code \n',
                        style: Styles.styleRegular16(context)),
                    TextSpan(
                        text: 'Wrong Number?',
                        style: Styles.styleRegular16(context).copyWith(
                            height: 1.5,
                            color:
                                SizeConfig.isLight ? kblueLight : kblueDark)),
                  ])),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: IntrinsicWidth(
                  child: CustomTextField(
                    inputFormattersMaxLength: 6,
                    controller: otpController,
                    autoFocus: true,
                    hintText: '_ _ _ _ _ _',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter 6-digits code',
                style: Styles.styleRegular16(context),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap:
                    //TODO resend code
                    () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Icon(Icons.message,
                          color: SizeConfig.isLight ? kgreyLight : kgreyDark),
                      const SizedBox(width: 20),
                      Text('Resend SMS',
                          style: Styles.styleMedium18(context).copyWith(
                              color:
                                  SizeConfig.isLight ? kgreyLight : kgreyDark)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
