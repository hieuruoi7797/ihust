import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
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
}
