import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

// need refactoring

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("id", user.id!);
    prefs.setString("firstname", user.firstName!);
    prefs.setString("lastname", user.lastName!);
    prefs.setString("email", user.email!);
    prefs.setString("token", user.token!);
    prefs.setString("role", user.role!);
    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt("id");
    String? firstname = prefs.getString("firstname");
    String? lastname = prefs.getString("lastname");
    String? email = prefs.getString("email");
    String role = prefs.getString("role")!;
    String? token = prefs.getString("token");

    return User(
        id: id,
        firstName: firstname,
        lastName: lastname,
        email: email,
        role: role,
        token: token);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("id");
    prefs.remove("firstname");
    prefs.remove("lastname");
    prefs.remove("email");
    prefs.remove("token");
    prefs.remove('role');
    // prefs.clear();
  }
}
