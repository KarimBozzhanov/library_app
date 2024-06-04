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

  /// `Discover and relax with our online library app. Read from anywhere and find books you'll love. Happy reading!`
  String get launchDescription {
    return Intl.message(
      'Discover and relax with our online library app. Read from anywhere and find books you\'ll love. Happy reading!',
      name: 'launchDescription',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get logIn {
    return Intl.message(
      'Get Started',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get repPassword {
    return Intl.message(
      'Confirm password',
      name: 'repPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t have account?',
      name: 'doNotHaveAccount',
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

  /// `Please fill your details to login`
  String get fillYourDetailsToLogin {
    return Intl.message(
      'Please fill your details to login',
      name: 'fillYourDetailsToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please fill your details to sign up`
  String get fillYourDetailsToSignUp {
    return Intl.message(
      'Please fill your details to sign up',
      name: 'fillYourDetailsToSignUp',
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

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
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

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Happy Reading!`
  String get happyReading {
    return Intl.message(
      'Happy Reading!',
      name: 'happyReading',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Top Books`
  String get topBooks {
    return Intl.message(
      'Top Books',
      name: 'topBooks',
      desc: '',
      args: [],
    );
  }

  /// `Latest Books`
  String get latestBooks {
    return Intl.message(
      'Latest Books',
      name: 'latestBooks',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Books`
  String get upcomingBooks {
    return Intl.message(
      'Upcoming Books',
      name: 'upcomingBooks',
      desc: '',
      args: [],
    );
  }

  /// `see more`
  String get seeMore {
    return Intl.message(
      'see more',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `List is empty`
  String get emptyList {
    return Intl.message(
      'List is empty',
      name: 'emptyList',
      desc: '',
      args: [],
    );
  }

  /// `Failed to retrieve data`
  String get failedToRetrieveData {
    return Intl.message(
      'Failed to retrieve data',
      name: 'failedToRetrieveData',
      desc: '',
      args: [],
    );
  }

  /// `Author: `
  String get author {
    return Intl.message(
      'Author: ',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Category: `
  String get category {
    return Intl.message(
      'Category: ',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Type: `
  String get type {
    return Intl.message(
      'Type: ',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Status: `
  String get status {
    return Intl.message(
      'Status: ',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `In library`
  String get inLibrary {
    return Intl.message(
      'In library',
      name: 'inLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Booked`
  String get booked {
    return Intl.message(
      'Booked',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
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
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'ru'),
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
