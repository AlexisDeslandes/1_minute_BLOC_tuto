import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_minute_bloc_tuto/app_permissions/app_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelperMock extends Mock implements PermissionHelper {}

void main() {
  group("AppPermissionsCubit", () {
    late PermissionHelper permissionHelper;

    setUp(() {
      permissionHelper = PermissionHelperMock();
    });

    group('fetchPermissions', () {
      blocTest<AppPermissionsCubit, AppPermissionsState>(
        '''When permission.camera is not granted and permission.microphone is granted 
        it should return an AppPermissionsState with {camera:false,microphone:true}.''',
        build: () {
          when(() => permissionHelper.isGranted(Permission.camera))
              .thenAnswer((_) async => false);
          when(() => permissionHelper.isGranted(Permission.microphone))
              .thenAnswer((_) async => true);
          return AppPermissionsCubit(permissionHelper: permissionHelper);
        },
        act: (bloc) => bloc.fetchPermissions(),
        expect: () => [
          AppPermissionsState(
              {Permission.camera: false, Permission.microphone: true})
        ],
      );
    });
  });
}
