class Endpoint {
  /// START OF AUTH ENDPOINTS ================================================
  static const String register = '/auth/registrations';
  static const String profile = '/auth';
  static const String login = '/auth';
  static const String forgotPassword = '/reset';
  static const String verificationLink = '/users/email/verifications/link';
  static const String notification = '/users/notification_setting';
  static const String faq = '/faqs';
  static const String editProfilePicture = '/auth/update';
  static const String uploadAsset = '/users/asset_uploads';
  /// END OF AUTH ENDPOINTS ==================================================

  static const String updateProfile = '/users';

  static const String getAllVoucher = '/user_vouchers';

  /// START OF SHIPPING ENDPOINTS =============================================
  static const String addresses = '/users/shipping';
  static const String countries = '/postalcode/countries';
  static const String province = '/postalcode/province';
  static const String city = '/postalcode/city';
  /// END OF SHIPPING ENDPOINTS ================================================
}
