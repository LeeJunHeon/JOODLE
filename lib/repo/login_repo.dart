import 'package:flutter_riverpod/flutter_riverpod.dart';

  final userNameProvider = StateProvider<String>((ref) {
    return 'abcd';
  });