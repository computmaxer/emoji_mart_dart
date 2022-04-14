import 'package:js/js.dart' as js;

import 'js_interop.dart';

class EmojiIndex {
  static EmojiData search(String keyword) =>
      js.allowInterop(emojiIndex.search(keyword));
}
