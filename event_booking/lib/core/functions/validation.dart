bool isvalidEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email);
}

bool isEgyptionPhone(String phone) {
  final RegExp phoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  return phoneRegex.hasMatch(phone);
}

bool isValidPassword(String password) {
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$');
  return passwordRegex.hasMatch(password);
}
