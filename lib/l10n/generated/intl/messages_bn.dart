// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a bn locale. All the
// messages from the main program should be duplicated here with the same
// function name.
// @dart=2.12
// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'bn';

  static m0(count) =>
      "${Intl.plural(count, zero: 'আপনার কোনো কাজ শেষ হয়নি', one: 'আপনি শুধুমাত্র একটি সম্পূর্ণ কাজ আছে', other: 'আপনার ${count}টি কাজ সম্পন্ন হয়েছে')}";

  static m1(count) =>
      "${Intl.plural(count, zero: 'আপনার কোনো মুলতুবি কাজ নেই', one: 'আপনার শুধুমাত্র একটি মুলতুবি কাজ আছে', other: 'আপনার ${count}টি কাজ বাকি আছে')}";

  static m2(count) => "মোট কাজ: ${count}";

  @override
  final Map<String, dynamic> messages =
      _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
        'addButton': MessageLookupByLibrary.simpleMessage('আইটেম যোগ করুন'),
        'button_addItem': MessageLookupByLibrary.simpleMessage('যোগ করুন'),
        'completed_todo': m0,
        'hint_addItem':
            MessageLookupByLibrary.simpleMessage('আপনার নতুন কাজ টাইপ করুন'),
        'list_title': MessageLookupByLibrary.simpleMessage('করণীয় তালিকা'),
        'pending_todo': m1,
        'title': MessageLookupByLibrary.simpleMessage('ToDo App'),
        'title_addItem': MessageLookupByLibrary.simpleMessage(
            'একটি নতুন করণীয় আইটেম যোগ করুন'),
        'total_todo': m2
      };
}
