@JS()
library emoji_mart.src.nimble_emoji;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';
import 'package:over_react/over_react.dart';

import '../util/js_component.dart';
import 'emoji.dart';

part 'nimble_emoji.over_react.g.dart';

/// OverReact bindings for the emoji-mart `NimbleEmoji` JS component.
UiFactory<NimbleEmojiProps> NimbleEmoji = uiJsComponent<NimbleEmojiProps>(
  ReactJsComponentFactoryProxy(_jsNimbleEmoji),
  _$NimbleEmojiConfig, // ignore: undefined_identifier
);

@Props(keyNamespace: '')
mixin NimbleEmojiPropsMixin on UiProps {
  @requiredProp
  Map<String, dynamic> data;
}

/// The concrete props class for the [NimbleEmoji] component.
class NimbleEmojiProps = UiProps with EmojiPropsMixin, NimbleEmojiPropsMixin;

@JS('EmojiMart.NimbleEmoji')
external ReactClass get _jsNimbleEmoji;
