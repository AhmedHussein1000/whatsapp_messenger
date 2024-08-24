import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/core/helpers/custom_alert_dialog.dart';
import 'package:whatsapp_messenger/core/helpers/extensions.dart';
import 'package:whatsapp_messenger/core/helpers/routes.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';
import 'package:whatsapp_messenger/feature/auth/widgets/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController countryController;
  late TextEditingController codeController;
  late TextEditingController phoneController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryController = TextEditingController(text: 'Select your country');
    codeController = TextEditingController(text: 'code');
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countryController.dispose();
    codeController.dispose();
    phoneController.dispose();
  }

  checkNumberValidation(BuildContext context) {
    if (phoneController.text == '' || phoneController.text.isEmpty) {
      return customAlertDialog(context, 'Please enter your phone number');
    } else if (phoneController.text.length < 5 ||
        phoneController.text.length > 15) {
      return customAlertDialog(context, 'Please enter a valid phone number');
    } else if (countryController.text == 'Egypt' &&
        phoneController.text.length != 11) {
      return customAlertDialog(
          context, 'Please enter a valid Egyptian phone number with 11 digits');
    } else {
      context.pushNamedAndRemoveUntil(Routes.verification,
          predicate: (context) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextField(
            readOnly: true,
            controller: countryController,
            hintText: countryController.text,
            onTap: () {
              countryPicker(context);
            },
            textAlign: TextAlign.center,
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IntrinsicWidth(
                child: CustomTextField(
                  textAlign: TextAlign.center,
                  controller: codeController,
                  onTap: () {
                    countryPicker(context);
                  },
                  hintText: codeController.text,
                  readOnly: true,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomTextField(
                  controller: phoneController,
                  inputFormattersMaxLength: 15,
                  hintStyle: Styles.styleSemiBold20(context).copyWith(
                      color: SizeConfig.isLight ? kgreyLight : kgreyDark),
                  hintText: 'Phone number',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Carrier charges may apply',
            style: Styles.styleRegular16(context),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              checkNumberValidation(context);
            },
            child: Text(
              'NEXT',
              style: Styles.styleMedium18(context),
            ),
          ),
        ],
      ),
    );
  }

  countryPicker(BuildContext context) {
    return showCountryPicker(
        showPhoneCode: true,
        context: context,
        countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: SizeConfig.isLight ? Colors.white : Colors.black,
            textStyle: Styles.styleSemiBold16(context),
            bottomSheetHeight: SizeConfig.screenHeight * 0.6,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        onSelect: (Country country) {
          countryController.text = country.name;
          codeController.text = '+${country.phoneCode}';
        });
  }
}
