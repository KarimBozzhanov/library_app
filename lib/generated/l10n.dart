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
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.of(context).');
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

  /// `Open and enjoy our blogging app. Share your thoughts, publish ideas, and find inspiration! Happy blogging!`
  String get launchDescription {
    return Intl.message(
      'Open and enjoy our blogging app. Share your thoughts, publish ideas, and find inspiration! Happy blogging!',
      name: 'launchDescription',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
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

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get repPassword {
    return Intl.message(
      'Repeat Password',
      name: 'repPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpHere {
    return Intl.message(
      'Sign Up',
      name: 'signUpHere',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your details to log in`
  String get fillYourDetailsToLogin {
    return Intl.message(
      'Please fill in your details to log in',
      name: 'fillYourDetailsToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your details to sign up`
  String get fillYourDetailsToSignUp {
    return Intl.message(
      'Please fill in your details to sign up',
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

  /// `Favorites`
  String get saved {
    return Intl.message(
      'Favorites',
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

  /// `Profile`
  String get account {
    return Intl.message(
      'Profile',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Happy blogging!`
  String get happyReading {
    return Intl.message(
      'Happy blogging!',
      name: 'happyReading',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
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

  /// `Popular Posts`
  String get topBooks {
    return Intl.message(
      'Popular Posts',
      name: 'topBooks',
      desc: '',
      args: [],
    );
  }

  /// `Latest Posts`
  String get latestBooks {
    return Intl.message(
      'Latest Posts',
      name: 'latestBooks',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Posts`
  String get upcomingBooks {
    return Intl.message(
      'Upcoming Posts',
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

  /// `Published`
  String get inLibrary {
    return Intl.message(
      'Published',
      name: 'inLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Draft`
  String get booked {
    return Intl.message(
      'Draft',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get book {
    return Intl.message(
      'Publish',
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

  /// `Post added to favorites`
  String get bookAddedToFavorites {
    return Intl.message(
      'Post added to favorites',
      name: 'bookAddedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russianLanguage {
    return Intl.message(
      'Russian',
      name: 'russianLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishLanguage {
    return Intl.message(
      'English',
      name: 'englishLanguage',
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

  /// `Kazakh`
  String get kazakhLanguage {
    return Intl.message(
      'Kazakh',
      name: 'kazakhLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Russia`
  String get russia {
    return Intl.message(
      'Russia',
      name: 'russia',
      desc: '',
      args: [],
    );
  }

  /// `USA`
  String get usa {
    return Intl.message(
      'USA',
      name: 'usa',
      desc: '',
      args: [],
    );
  }

  /// `Kazakhstan`
  String get kazakhstan {
    return Intl.message(
      'Kazakhstan',
      name: 'kazakhstan',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get addPost {
    return Intl.message(
      'Create Post',
      name: 'addPost',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get postTitle {
    return Intl.message(
      'Title',
      name: 'postTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get postDescription {
    return Intl.message(
      'Description',
      name: 'postDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tag`
  String get postTag {
    return Intl.message(
      'Tag',
      name: 'postTag',
      desc: '',
      args: [],
    );
  }

  /// `Post created`
  String get postAdded {
    return Intl.message(
      'Post created',
      name: 'postAdded',
      desc: '',
      args: [],
    );
  }

  /// `Failed to create post`
  String get failedToAddPost {
    return Intl.message(
      'Failed to create post',
      name: 'failedToAddPost',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment`
  String get addComment {
    return Intl.message(
      'Add Comment',
      name: 'addComment',
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
