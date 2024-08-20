import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_messenger/core/utils/colors.dart';
import 'package:whatsapp_messenger/core/utils/size_config.dart';
import 'package:whatsapp_messenger/core/utils/styles.dart';
import 'package:whatsapp_messenger/feature/welcome/controller/languages_cubit/languages_cubit.dart';
import 'package:whatsapp_messenger/feature/welcome/widgets/languages_bottomsheet.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<LanguagesCubit, String>(
      builder: (context, selectedLanguage) {
        return InkWell(
          onTap: () {
            languagesBottomSheet(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: SizeConfig.isLight ? klangBackLight : klangBackDark,
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.language,
                  color: SizeConfig.isLight ? kblueLight : kblueDark),
              const SizedBox(width: 8),
              Text(selectedLanguage,
                  style: Styles.styleRegular16(context).copyWith(
                      color: SizeConfig.isLight ? kblueLight : kblueDark)),
              const SizedBox(width: 8),
              Icon(Icons.arrow_drop_down,
                  color: SizeConfig.isLight ? kblueLight : kblueDark),
            ]),
          ),
        );
      },
    );
  }
}
