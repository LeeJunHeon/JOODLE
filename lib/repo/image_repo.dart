import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageUnit8List = StateProvider<List<Uint8List>>((ref) {
  List<Uint8List> imageData = [];
  return imageData;
});