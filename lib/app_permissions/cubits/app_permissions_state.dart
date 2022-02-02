import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionsState extends Equatable {
  const AppPermissionsState([this.isActiveByPermission = const {}]);

  final Map<Permission, bool> isActiveByPermission;

  @override
  List<Object?> get props => [isActiveByPermission];
}
