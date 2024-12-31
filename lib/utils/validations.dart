class Validations {
  static bool emailValidator(String email) {
    bool emailValid = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(email);

    return emailValid;
  }
}
