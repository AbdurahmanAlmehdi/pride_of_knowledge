class AValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is Required';
    }

    final emailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegEx.hasMatch(value)) {
      return 'Invalid Email';
    }

    return null;
  }

  static String? isRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is Required';
    }

    return null;
  }

  static String? validatePhoneNum(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is Required';
    }

    final phoneNumRegEx = RegExp(r'09[1-4]\d{7}');

    if (!phoneNumRegEx.hasMatch(value)) {
      return 'Phone Number must match 09XXXXXXXX';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is Required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 character';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least 1 Capital letter';
    }
    if (value.contains(' ')) {
      return 'Password must not contain spaces';
    }

    return null;
  }
}
