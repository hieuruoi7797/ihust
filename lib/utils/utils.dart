import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart' as crypto;
import 'package:device_info/device_info.dart';
import 'package:tripledes/tripledes.dart';

class ClientUtils {
  String cryptoSuperPasss(String account, String pass) {
    var key = pass + "." + pass;
    var blockCipher = new BlockCipher(new DESEngine(), key);
    var message = pass;
    var ciphertext = blockCipher.encodeB64(message);
    return ciphertext;
  }

  String cryptoPasss(String account, String pass) {
    print(Utf8Encoder().convert(account.toLowerCase() + "." + pass));
    var encrypedPassword = crypto.md5
        .convert(Utf8Encoder().convert(account.toLowerCase() + "." + pass))
        .toString();
    var key = encrypedPassword;
    var blockCipher = new BlockCipher(new DESEngine(), key);
    var message = pass;
    var ciphertext = blockCipher.encodeB64(message);
    return ciphertext;
  }

  static Future<String> getDeviceDetails() async {
    // String deviceName;
    // String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        // deviceName = build.model;
        // deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        // deviceName = data.name;
        // deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on Exception {
      print('Failed to get platform version');
    }
    return identifier;
  }
}
