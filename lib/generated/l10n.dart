// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Browse the menu, choose your dish, and enjoy!`
  String get splash_sub_title {
    return Intl.message(
      'Browse the menu, choose your dish, and enjoy!',
      name: 'splash_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcome_to {
    return Intl.message(
      'Welcome to',
      name: 'welcome_to',
      desc: '',
      args: [],
    );
  }

  /// `FOOD ZONE`
  String get food_zone {
    return Intl.message(
      'FOOD ZONE',
      name: 'food_zone',
      desc: '',
      args: [],
    );
  }

  /// `We serve incomparable delicacies`
  String get on_boarding_title1 {
    return Intl.message(
      'We serve incomparable delicacies',
      name: 'on_boarding_title1',
      desc: '',
      args: [],
    );
  }

  /// `Your Meal, Just a Tap Away`
  String get on_boarding_title2 {
    return Intl.message(
      'Your Meal, Just a Tap Away',
      name: 'on_boarding_title2',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Order in Real Time`
  String get on_boarding_title3 {
    return Intl.message(
      'Track Your Order in Real Time',
      name: 'on_boarding_title3',
      desc: '',
      args: [],
    );
  }

  /// `Unbeatable Deals on Every Meal`
  String get on_boarding_title4 {
    return Intl.message(
      'Unbeatable Deals on Every Meal',
      name: 'on_boarding_title4',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy browsing diverse menus and choose your perfect meal wherever you are.`
  String get on_boarding_sup_title1 {
    return Intl.message(
      'Enjoy browsing diverse menus and choose your perfect meal wherever you are.',
      name: 'on_boarding_sup_title1',
      desc: '',
      args: [],
    );
  }

  /// `All the best restaurants with their top menu waiting for you, they cant’t wait for your order!`
  String get on_boarding_sup_title2 {
    return Intl.message(
      'All the best restaurants with their top menu waiting for you, they cant’t wait for your order!',
      name: 'on_boarding_sup_title2',
      desc: '',
      args: [],
    );
  }

  /// `Get real-time updates on your order’s status, from preparation in the kitchen to delivery at your door.`
  String get on_boarding_sup_title3 {
    return Intl.message(
      'Get real-time updates on your order’s status, from preparation in the kitchen to delivery at your door.',
      name: 'on_boarding_sup_title3',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy exclusive deals and get the best offers for an unforgettable dining experience.`
  String get on_boarding_sup_title4 {
    return Intl.message(
      'Enjoy exclusive deals and get the best offers for an unforgettable dining experience.',
      name: 'on_boarding_sup_title4',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get on_boarding_next_btn {
    return Intl.message(
      'Next',
      name: 'on_boarding_next_btn',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get on_boarding_skip_btn {
    return Intl.message(
      'Skip',
      name: 'on_boarding_skip_btn',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get choose_language {
    return Intl.message(
      'Choose Language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Device Language`
  String get device_language {
    return Intl.message(
      'Device Language',
      name: 'device_language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Create your new account`
  String get register_title {
    return Intl.message(
      'Create your new account',
      name: 'register_title',
      desc: '',
      args: [],
    );
  }

  /// `Login in your Account`
  String get login_title {
    return Intl.message(
      'Login in your Account',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Please login to your account`
  String get login_sup_title {
    return Intl.message(
      'Please login to your account',
      name: 'login_sup_title',
      desc: '',
      args: [],
    );
  }

  /// `Create an account to start looking for the food you like`
  String get register_sup_title {
    return Intl.message(
      'Create an account to start looking for the food you like',
      name: 'register_sup_title',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_title {
    return Intl.message(
      'Email Address',
      name: 'email_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get hint_email {
    return Intl.message(
      'Enter Email',
      name: 'hint_email',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name_title {
    return Intl.message(
      'User Name',
      name: 'user_name_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get hint_user_name {
    return Intl.message(
      'Enter Full Name',
      name: 'hint_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_title {
    return Intl.message(
      'Password',
      name: 'password_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password_hint {
    return Intl.message(
      'Enter your password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password should be between 8 to 32 characters.`
  String get password_rules_length {
    return Intl.message(
      'Password should be between 8 to 32 characters.',
      name: 'password_rules_length',
      desc: '',
      args: [],
    );
  }

  /// `Uppercase, lowercase, numbers, or special chars (e.g., @, #, $, %).`
  String get password_rules_complexity {
    return Intl.message(
      'Uppercase, lowercase, numbers, or special chars (e.g., @, #, \$, %).',
      name: 'password_rules_complexity',
      desc: '',
      args: [],
    );
  }

  /// `Do not repeat characters or sequences (e.g., '123456', 'abcdef').`
  String get password_rules_avoid_repetitions {
    return Intl.message(
      'Do not repeat characters or sequences (e.g., \'123456\', \'abcdef\').',
      name: 'password_rules_avoid_repetitions',
      desc: '',
      args: [],
    );
  }

  /// `I Agree with `
  String get agree_with {
    return Intl.message(
      'I Agree with ',
      name: 'agree_with',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get term_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'term_of_service',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_btn {
    return Intl.message(
      'Register',
      name: 'register_btn',
      desc: '',
      args: [],
    );
  }

  /// `Or register with`
  String get register_with {
    return Intl.message(
      'Or register with',
      name: 'register_with',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get sign_in_with {
    return Intl.message(
      'Or sign in with',
      name: 'sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get not_have_account {
    return Intl.message(
      'Don’t have an account? ',
      name: 'not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have account? `
  String get already_have_account {
    return Intl.message(
      'Already have account? ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get bottom_sheet_title {
    return Intl.message(
      'Forgot Password?',
      name: 'bottom_sheet_title',
      desc: '',
      args: [],
    );
  }

  /// `Select which contact details should we use to reset your password`
  String get bottom_sheet_sub_title {
    return Intl.message(
      'Select which contact details should we use to reset your password',
      name: 'bottom_sheet_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Send via Phone number`
  String get bottom_sheet_phone {
    return Intl.message(
      'Send via Phone number',
      name: 'bottom_sheet_phone',
      desc: '',
      args: [],
    );
  }

  /// `Phone number required`
  String get bottom_sheet_phone_required {
    return Intl.message(
      'Phone number required',
      name: 'bottom_sheet_phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Send via Email`
  String get bottom_sheet_email {
    return Intl.message(
      'Send via Email',
      name: 'bottom_sheet_email',
      desc: '',
      args: [],
    );
  }

  /// `Email required`
  String get bottom_sheet_email_required {
    return Intl.message(
      'Email required',
      name: 'bottom_sheet_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get bottom_sheet_btn_name {
    return Intl.message(
      'Continue',
      name: 'bottom_sheet_btn_name',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we’ll send you confirmation code to reset your password`
  String get email_forgot_password_title {
    return Intl.message(
      'Enter your email address and we’ll send you confirmation code to reset your password',
      name: 'email_forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number and we’ll send you confirmation code to reset your password`
  String get phone_forgot_password_title {
    return Intl.message(
      'Enter your phone number and we’ll send you confirmation code to reset your password',
      name: 'phone_forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get email_verification_title {
    return Intl.message(
      'Email Verification',
      name: 'email_verification_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code we send you on:`
  String get email_verification_sup_title {
    return Intl.message(
      'Enter the verification code we send you on:',
      name: 'email_verification_sup_title',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive code?`
  String get email_otp_not_receive {
    return Intl.message(
      'Didn’t receive code?',
      name: 'email_otp_not_receive',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get email_otp_resend {
    return Intl.message(
      'Resend Code',
      name: 'email_otp_resend',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify_button {
    return Intl.message(
      'Verify',
      name: 'verify_button',
      desc: '',
      args: [],
    );
  }

  /// `Back to `
  String get back_to {
    return Intl.message(
      'Back to ',
      name: 'back_to',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Code`
  String get invalid_code {
    return Intl.message(
      'Invalid Code',
      name: 'invalid_code',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone Verification`
  String get phone_verification {
    return Intl.message(
      'Phone Verification',
      name: 'phone_verification',
      desc: '',
      args: [],
    );
  }

  /// `Code has been send to:`
  String get code_sent_to_the {
    return Intl.message(
      'Code has been send to:',
      name: 'code_sent_to_the',
      desc: '',
      args: [],
    );
  }

  /// `Email address is required`
  String get email_required {
    return Intl.message(
      'Email address is required',
      name: 'email_required',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_required {
    return Intl.message(
      'Password is required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }

  /// `Only Google, Outlook, and Yahoo emails are accepted.`
  String get email_accepted {
    return Intl.message(
      'Only Google, Outlook, and Yahoo emails are accepted.',
      name: 'email_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcome_back {
    return Intl.message(
      'Welcome back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Your password does not meet the required rules.`
  String get password_not_follow_rules {
    return Intl.message(
      'Your password does not meet the required rules.',
      name: 'password_not_follow_rules',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get password_not_match {
    return Intl.message(
      'Passwords do not match.',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed`
  String get bottom_sheet_password_changed {
    return Intl.message(
      'Password Changed',
      name: 'bottom_sheet_password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully, You can now log in using the new password.`
  String get bottom_sheet_password_changed_title {
    return Intl.message(
      'Password changed successfully, You can now log in using the new password.',
      name: 'bottom_sheet_password_changed_title',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get text_form_required {
    return Intl.message(
      'Required',
      name: 'text_form_required',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from the previously used password`
  String get password_must_be_different {
    return Intl.message(
      'Your new password must be different from the previously used password',
      name: 'password_must_be_different',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created successfully`
  String get account_created_successfully {
    return Intl.message(
      'Your account has been created successfully',
      name: 'account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get user_name_required {
    return Intl.message(
      'Username is required',
      name: 'user_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Username must begin with a letter and be 8 to 20 characters long, containing only letters and numbers`
  String get user_name_error {
    return Intl.message(
      'Username must begin with a letter and be 8 to 20 characters long, containing only letters and numbers',
      name: 'user_name_error',
      desc: '',
      args: [],
    );
  }

  /// `Both password must match`
  String get both_password_match {
    return Intl.message(
      'Both password must match',
      name: 'both_password_match',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Liked`
  String get liked {
    return Intl.message(
      'Liked',
      name: 'liked',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Special Offers`
  String get special_offers {
    return Intl.message(
      'Special Offers',
      name: 'special_offers',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message(
      'View All',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get deliver_to {
    return Intl.message(
      'Deliver to',
      name: 'deliver_to',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Location`
  String get select_your_location {
    return Intl.message(
      'Select Your Location',
      name: 'select_your_location',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
