import 'package:flutter/widgets.dart';
import '../../presentation/pages/_pages.dart';

class Routes {

  static String root = '/';
  static String login = '/login';
  static String characters = '/characters';
  static String characterIntroduction = '/character-introduction';
  static String talk = '/talk';

  static Map<String, WidgetBuilder> getRoutes(context){
    return {
      root: (context) => TopPage(),
      login: (context) => const LoginPage(),
      characters: (context) => CharactersPage(),
      characterIntroduction: (context) => CharacterIntroductionPage(),
      talk: (context) => TalkPage(),
    };
  }
  
}