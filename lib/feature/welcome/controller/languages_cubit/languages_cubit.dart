import 'package:bloc/bloc.dart';

class LanguagesCubit extends Cubit<String> {
  LanguagesCubit() : super('English');
  
  void changeLanguage(String language) => emit(language);
  
}
