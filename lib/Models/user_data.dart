class UserData {
  static String? firstName;
  static String? lastName;
  static String? address;
  static String? city;
  static String? state;
  static String? zipCode;
  static String? phone;
  static String? imagePath;

  static void setAddressData(Map<String, String> data) {
    firstName = data['firstName'];
    lastName = data['lastName'];
    address = data['address'];
    city = data['city'];
    state = data['state'];
    zipCode = data['zipCode'];
    phone = data['phone'];
    imagePath = data['imagePath'] ?? 'assets/cover/cover1.png';
  }

  static void clear() {
    firstName = null;
    lastName = null;
    address = null;
    city = null;
    state = null;
    zipCode = null;
    phone = null;
    imagePath = null;
  }
} 