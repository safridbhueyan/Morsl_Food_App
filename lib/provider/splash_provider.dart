import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = FutureProvider.autoDispose<bool>((ref)async{
  await Future.delayed(const Duration(seconds: 3));
  return true;
});
