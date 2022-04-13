import 'dart:html';

import 'package:emoji_mart/emoji_mart.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;

part 'main.over_react.g.dart';

void main() {
  react_dom.render(ExampleComponent()(), querySelector('#picker'));
}

mixin ExampleComponentProps on UiProps {}

UiFactory<ExampleComponentProps> ExampleComponent = uiFunction((props) {
  final pickerOpen = useState(false);
  final selectedEmoji = useState<EmojiData>(null);

  void handleBtnClick(_) {
    pickerOpen.set(!pickerOpen.value);
  }

  void handleEmojiSelection(emoji) {
    selectedEmoji.set(emoji);
    pickerOpen.set(false);
  }

  return Dom.div()(
    Dom.div()(
      Dom.span()('Example emoji component: '),
      (Emoji()
        ..emoji = 'grinning'
        ..set = 'google'
        ..size = 16)(),
    ),
    Dom.div()(
      (Dom.button()..onClick = handleBtnClick)('Picker'),
      Dom.span()(" Selection: "),
      selectedEmoji.value != null
          ? (Emoji()
            ..emoji = selectedEmoji.value.id
            ..set = 'google'
            ..size = 16)()
          : null,
    ),
    pickerOpen.value
        ? (Picker()
          ..set = 'google'
          ..onSelect = handleEmojiSelection)()
        : null,
  );
}, _$ExampleComponentConfig);
