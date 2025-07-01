import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "Radya Connect";
  static String appUrl = "${dotenv.env['API_LINK']!}/api/";

  // images
  // static String imageLogo = 'assets/images/im_logo.png';

  // ======== Icons svg
  static String assetAdd = 'assets/icons/ic_add.svg';
}
