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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign up for {nameOfTheApp}`
  String signUpTitle(Object nameOfTheApp) {
    return Intl.message(
      'Sign up for $nameOfTheApp',
      name: 'signUpTitle',
      desc: '',
      args: [nameOfTheApp],
    );
  }

  /// `Log into your {nameOfTheApp} account`
  String loginTitle(Object nameOfTheApp) {
    return Intl.message(
      'Log into your $nameOfTheApp account',
      name: 'loginTitle',
      desc: '',
      args: [nameOfTheApp],
    );
  }

  /// `Create a profile, follow other accounts, make your own videos, and more.`
  String get signUpSubtitle {
    return Intl.message(
      'Create a profile, follow other accounts, make your own videos, and more.',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Use email & password`
  String get emailPasswordButton {
    return Intl.message(
      'Use email & password',
      name: 'emailPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueAppleButton {
    return Intl.message(
      'Continue with Apple',
      name: 'continueAppleButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message('Log in', name: 'logIn', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
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
