@JS()
library emoji_mart_interop;

import 'package:js/js.dart';
import 'package:react/react_client/react_interop.dart';

@JS('EmojiMart')
class EmojiMart {
  @JS('Picker')
  external static ReactClass get Picker;

  @JS('NimblePicker')
  external static ReactClass get NimblePicker;

  @JS('Emoji')
  external static ReactClass get Emoji;

  @JS('NimbleEmoji')
  external static ReactClass get NimbleEmoji;

  @JS('emojiIndex')
  external static NimbleEmojiIndex get emojiIndex;
}

@JS()
class NimbleEmojiIndex {
  @JS('search')
  external EmojiData search(String keyword);
}

@JS()
class EmojiData {
  external String get id;

  external String get name;

  external String get colons;

  external List<String> get emoticons;

  external String get unified;

  external int get skin;

  external String get native;
}
