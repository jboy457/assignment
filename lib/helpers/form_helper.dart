class FormHelper {
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp capitalLetterReg = RegExp(r".*[A-Z].*");
  RegExp specialReg = RegExp(r".*[@#\$&!_*].*");
  RegExp emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password should contain at least 8 characters';
    } else if (!capitalLetterReg.hasMatch(value)) {
      return 'Password must have at least one uppercase letter';
    } else if (!numReg.hasMatch(value)) {
      return 'Password must have at least one number';
    } else if (!specialReg.hasMatch(value)) {
      return 'Password must have at least one special character';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!emailReg.hasMatch(value)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  String? validateUsername(field, String? value) {
    if (value!.isEmpty) {
      return '$field is required';
    } else {
      return null;
    }
  }
}
