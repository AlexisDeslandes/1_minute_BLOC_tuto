import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  const PermissionHelper();

  Future<bool> isGranted(Permission permission) => permission.isGranted;
}
