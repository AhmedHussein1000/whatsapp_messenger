import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messenger/core/helpers/extensions.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/constants.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';
import 'package:whatsapp_messenger/feature/welcome/controller/languages_cubit/languages_cubit.dart';

PersistentBottomSheetController languagesBottomSheet(BuildContext context) {
  String selectedLanguage = BlocProvider.of<LanguagesCubit>(context).state;
  int groupValue = selectedLanguage == kEnglish ? 1 : 2;

  return showBottomSheet(
    context: context,
    backgroundColor: SizeConfig.isLight ? kbottomSheetLight : kbottomSheetDark,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                )),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.close)),
                const SizedBox(width: 20),
                Text(
                  'Choose App Language',
                  style: Styles.styleSemiBold20(context),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: SizeConfig.isLight
                  ? kgreyLight.withOpacity(0.3)
                  : kgreyDark.withOpacity(0.3),
            ),
            RadioListTile(
              value: 1,
              groupValue: groupValue,
              activeColor: kgreenDark,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
                BlocProvider.of<LanguagesCubit>(context)
                    .changeLanguage(kEnglish);
              },
              title: Text(kEnglish, style: Styles.styleMedium18(context)),
              subtitle: Text(
                'Default Language',
                style: Styles.styleMedium16(context),
              ),
            ),
            const SizedBox(height: 10),
            RadioListTile(
              value: 2,
              groupValue: groupValue,
              activeColor: kgreenDark,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
                BlocProvider.of<LanguagesCubit>(context)
                    .changeLanguage(kArabic);
              },
              title: Text(kArabic, style: Styles.styleMedium18(context)),
              subtitle: Text(
                'اللغة العربية',
                style: Styles.styleMedium16(context),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
