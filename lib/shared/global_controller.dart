import 'package:flutter_styled_widgets/constants/enums.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  var count = 0.obs;
  increment() => count++;

  final Rx<UserRole> role = UserRole.user.obs;
  void setRole(UserRole newRole) {
    role.value = newRole;
  }
}
