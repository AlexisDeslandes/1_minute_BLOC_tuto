import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_minute_bloc_tuto/app_permissions/app_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionsCubit extends Cubit<AppPermissionsState> {
  AppPermissionsCubit({required this.permissionHelper})
      : super(const AppPermissionsState());

  final PermissionHelper permissionHelper;

  Future<bool> _isActive(Permission permission) async =>
      await permissionHelper.isGranted(permission);

  Future<void> fetchPermissions() async {
    emit(AppPermissionsState({
      Permission.camera: await _isActive(Permission.camera),
      Permission.microphone: await _isActive(Permission.microphone)
    }));
  }
}
