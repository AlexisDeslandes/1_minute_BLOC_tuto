import 'dart:io';

mixin TestMixin on Object {
  bool get isTesting => Platform.environment.containsKey("FLUTTER_TEST");
}