import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

class mapLounch extends ChangeNotifier {
  static Future<void> openMap(link) async {
    String googleUrl = '$link';
    // ignore: deprecated_member_use
    if (await canLaunch(googleUrl)) {
      // ignore: deprecated_member_use
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  mapgetting(link) async {
    await openMap(link);
    notifyListeners();
  }
}
