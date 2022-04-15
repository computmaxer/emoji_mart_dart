@JS()
library emoji_mart.src.emoji;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';
import 'package:over_react/over_react.dart';

import '../js_interop.dart';
import '../util/js_component.dart';

part 'emoji.over_react.g.dart';

/// OverReact bindings for the emoji-mart `Emoji` JS component.
UiFactory<EmojiProps> Emoji = uiJsComponent<EmojiProps>(
  ReactJsComponentFactoryProxy(_jsEmoji),
  _$EmojiConfig, // ignore: undefined_identifier
);

@Props(keyNamespace: '')
mixin EmojiPropsMixin on UiProps {
  /// Which emoji is being rendered by this component.
  /// Either a string or an emoji object.
  @requiredProp
  dynamic /* EmojiData or String */ emoji;

  /// The emoji width and height.
  @requiredProp
  int size;

  /// Renders the native unicode emoji.
  ///
  /// Default: `false`
  bool native;

  /// Called when an emoji is clicked. Not called when emoji is
  /// selected with enter.
  @Accessor(key: 'onClick')
  void Function(EmojiData emoji, SyntheticMouseEvent event) onEmojiClick;

  /// We cannot use `onClick` since it is defined in [UiProps] as a function
  /// that takes one param, and the underlying JS component takes two params.
  /// We redirect consumers to use [onEmojiClick] as a workaround.
  @Deprecated(
      'Setting this will cause runtime errors. Use onEmojiClick instead.')
  @override
  get onClick;

  @Deprecated(
      'Setting this will cause runtime errors. Use onEmojiClick instead.')
  @override
  set onClick(value);

  /// Called when the mouse leaves this emoji.
  void Function(EmojiData emoji, SyntheticMouseEvent event) onLeave;

  /// Called when the mouse hovers this emoji.
  void Function(EmojiData emoji, SyntheticMouseEvent event) onOver;

  /// Called when the selected emoji is not supported by the set.
  ///
  /// Return fallback emoji to render instead.
  dynamic Function(EmojiData emoji, SyntheticMouseEvent event) fallback;

  /// The emoji set: 'apple', 'google', 'twitter', 'facebook'.
  ///
  /// Default: `apple`
  String set;

  /// The emoji sheet size: 16, 20, 32, 64.
  ///
  /// Default: `64`
  int sheetSize;

  /// A Fn that returns that image sheet to use for emojis.
  /// Useful for avoiding a request if you have the sheet locally.
  String Function(String set, int sheetSize) backgroundImageFn;

  /// Skin color: 1, 2, 3, 4, 5, 6.
  ///
  /// Default: `1`
  int skin;

  /// Show emoji short name when hovering (title).
  ///
  /// Default: `false`
  bool tooltip;

  /// Returns an HTML string to use with dangerouslySetInnerHTML.
  ///
  /// Default: `false`
  bool html;
}

/// The concrete props class for the [Emoji] component.
class EmojiProps = UiProps with EmojiPropsMixin;

@JS('EmojiMart.Emoji')
external ReactClass get _jsEmoji;
