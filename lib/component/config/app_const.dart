import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "Flutter Test";
  static String appUrl = "${dotenv.env['API_LINK']!}/api/";

  // images
  static String imageBackPack = 'assets/images/backpack.png';
  static String imageDrum = 'assets/images/drum.png';
  static String imageGuitar = 'assets/images/guitar.png';
  static String imageJeans = 'assets/images/jeans.png';
  static String imagekarati = 'assets/images/karati.png';
  static String imageShorts = 'assets/images/shorts.png';
  static String imageSkates = 'assets/images/skates.png';
  static String imageSuitCase = 'assets/images/suitcase.png';

  // ======== Icons svg
  static String assetAdd = 'assets/icons/ic_add.svg';
}
