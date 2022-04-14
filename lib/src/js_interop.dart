@JS()
library emoji_mart_interop;

import 'package:js/js.dart';

@JS('EmojiMart.emojiIndex')
external NimbleEmojiIndex get emojiIndex;

@anonymous
@JS()
class NimbleEmojiIndex {
  external EmojiData search(String keyword);
}

@anonymous
@JS()
abstract class EmojiData {
  external String get id;
  external String get name;
  external String get colons;
  external List<String> get emoticons;
  external String get unified;
  external int get skin;
  external String get native;
}
