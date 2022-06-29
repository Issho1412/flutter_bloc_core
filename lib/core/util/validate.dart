class Validate {
  Validate._();

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'メールアドレス''pl_input';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "email_is_not_correct";
    }
    return null;
  }

  static String? validateText(String? text, String? nameField) {
    if (text == null || text.isEmpty) {
      return '$nameField''pl_input';
    }
    return null;
  }

  static String? validateName(String s) {
    if (_isNumeric(s)) {
      return 'Invalid Name!';
    }
    if (s.isEmpty) {
      return 'Don\'t forget your name!';
    }
    return null;
  }

  static String? validatePass(String? passWord) {
    var passReg = r"^(?=.*[A-Z])[a-zA-Z\d]{8,16}$";
    if (passWord == null || passWord.isEmpty) {
      return 'password''pl_input';
    }

    if (!RegExp(passReg).hasMatch(passWord)) {
      return "wrong_format_pass";
    }
    return null;
  }

  static String? validatePasscode(String? passcode) {
    var passcodeReg = r'^[0-9]{4,8}$';
    if (passcode == null || passcode.isEmpty) {
      return 'passcode_empty';
    }

    if (!RegExp(passcodeReg).hasMatch(passcode)) {
      return 'passcode_wrong_format';
    }
    return null;
  }

  static String? validateConfirmPass(String? passWord, String? confirmPass) {
    if (passWord != confirmPass) {
      return 'pass_does_not_match';
    }
    return null;
  }

  static bool _isNumeric(String s) {
    for (int i = 0; i < s.length; i++) {
      if (double.tryParse(s[i]) != null) {
        return true;
      }
    }
    return false;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null) {
      return "setting_up_phone_number"'pl_input';
    }
    if (double.tryParse(phoneNumber) == null) {
      return "setting_up_phone_number"'is_number';
    }
    if (phoneNumber.length < 10 || phoneNumber.length > 11) {
      return '電話番号が正しくありません。';
    }
    return null;
  }
}
