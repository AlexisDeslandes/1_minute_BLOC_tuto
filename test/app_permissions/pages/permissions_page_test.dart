import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_minute_bloc_tuto/app_permissions/app_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class FunctionMock<T> extends Mock {
  T call();
}

void main() {
  group("PermissionsPage", () {
    testWidgets(
        "tap on Switch of widget (key=camera) should call openAppSettings.",
        (tester) async {
      final openAppSettings = FunctionMock<Future<bool>>();
      when(() => openAppSettings.call()).thenAnswer((_) async => false);
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (BuildContext context) =>
              AppPermissionsCubit(permissionHelper: const PermissionHelper())
                ..emit(AppPermissionsState({Permission.camera: false})),
          child: PermissionsPage(openAppSettingsCallback: openAppSettings),
        ),
      ));
      await tester.pumpAndSettle();
      final cameraSwitchTile = find.byKey(const ValueKey("camera"));
      await tester.tap(cameraSwitchTile);
      verify(openAppSettings.call);
    });
  });
}
