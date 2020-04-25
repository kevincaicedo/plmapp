import 'dart:io';
import 'dart:convert';

extension Convert on File {
  String toBase64() {
    if (this == null) return null;
    final bytes = this.readAsBytesSync();
    return base64Encode(bytes);
  }
}
