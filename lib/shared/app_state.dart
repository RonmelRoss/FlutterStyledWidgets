import 'package:flutter/material.dart';
import 'package:flutter_styled_widgets/constants/enums.dart';

// State notifier for user roles
class AppState extends ChangeNotifier {
  UserRole _currentRole = UserRole.user; // Default role is 'user'

  // Get the current role
  UserRole get currentRole => _currentRole;

  // Set the user role and notify listeners about the change
  void setUserRole(UserRole role) {
    _currentRole = role;
    notifyListeners();
  }
}
