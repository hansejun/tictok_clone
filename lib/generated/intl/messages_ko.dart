// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(nameOfTheApp) => "${nameOfTheApp} 로그인하기";

  static String m1(nameOfTheApp) => "${nameOfTheApp} 가입하기";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "이미 계정이 있으세요?",
    ),
    "continueAppleButton": MessageLookupByLibrary.simpleMessage("Apple로 계속하기"),
    "emailPasswordButton": MessageLookupByLibrary.simpleMessage(
      "이메일 & 비밀번호 사용",
    ),
    "logIn": MessageLookupByLibrary.simpleMessage("로그인"),
    "loginTitle": m0,
    "signUpSubtitle": MessageLookupByLibrary.simpleMessage(
      "프로필 만들기, 다른 계정 팔로우, 자신의 비디오 만들기 등",
    ),
    "signUpTitle": m1,
  };
}
