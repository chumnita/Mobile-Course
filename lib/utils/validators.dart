class Validators {
  static String? validateName(String? value) {
    return (value == null || value.trim().isEmpty) ? 'Name is required' : null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$');
    return regex.hasMatch(value) ? null : 'Enter a valid email';
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone is required';
    final regex = RegExp(r'^[0-9]{8,12}$');
    return regex.hasMatch(value) ? null : 'Enter a valid phone number';
  }
}
