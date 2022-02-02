import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_minute_bloc_tuto/app_permissions/app_permissions.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage(
      {Key? key, this.openAppSettingsCallback = openAppSettings})
      : super(key: key);

  final Future<bool> Function() openAppSettingsCallback;

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // When app is resumed, user could have changed permissions.
      context.read<AppPermissionsCubit>().fetchPermissions();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Permissions'),
        ),
        body: Column(
          children: [
            BlocBuilder<AppPermissionsCubit, AppPermissionsState>(
                builder: (context, state) => Column(
                      children: state.isActiveByPermission.entries.map((e) {
                        final permissionName = e.key.toString().split(".")[1];
                        return SwitchListTile.adaptive(
                            key: ValueKey(permissionName),
                            title: Text(permissionName),
                            value: e.value,
                            onChanged: (_) => widget.openAppSettingsCallback());
                      }).toList(),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: Permission.camera.request,
                    child: const Text("Request camera")),
                ElevatedButton(
                    onPressed: Permission.microphone.request,
                    child: const Text("request microphone"))
              ],
            )
          ],
        ));
  }
}
