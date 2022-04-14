@JS()
library emoji_mart.src.picker;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';
import 'package:over_react/over_react.dart';

import '../js_interop.dart';
import '../util/js_component.dart';

part 'picker.over_react.g.dart';

/// OverReact bindings for the emoji-mart `Picker` JS component.
UiFactory<PickerProps> Picker = uiJsComponent<PickerProps>(
  ReactJsComponentFactoryProxy(_jsPicker),
  _$PickerConfig, // ignore: undefined_identifier
);

/// The concrete props class for the [Picker] component.
class PickerProps = UiProps with PickerPropsMixin;

/// A props mixin for props specific to the [ButtonBase] component.
@Props(keyNamespace: '')
mixin PickerPropsMixin on UiProps {
  /// Auto focus the search input when mounted.
  ///
  /// Default: `false`
  bool autoFocus;

  /// The top bar anchors select and hover color.
  ///
  /// Default: `#ae65c5`
  String color;

  /// The emoji shown when no emojis are hovered, set to an empty
  /// string to show nothing.
  ///
  /// Default: `department_store`
  String emoji;

  /// Only load included categories. Accepts I18n categories keys.
  /// Order will be respected, except for the recent category which
  /// will always be the first.
  ///
  /// Default: `[]`
  List<String> include;

  /// Don't load excluded categories. Accepts I18n categories keys.
  ///
  /// Default: `[]`
  List<String> exclude;

  /// Provide custom emojis to show up in the custom emoji category.
  List<EmojiData> custom;

  /// Pass your own frequently used emojis as array of string IDs.
  ///
  /// Default: `[]`
  List<String> recent;

  /// Instantly sort “Frequently Used” category.
  ///
  /// Default: `false`
  bool enableFrequentEmojiSort;

  /// The emoji width and height.
  ///
  /// Default: `24`
  int emojiSize;

  /// Called when an emoji is clicked. Not called when emoji is
  /// selected with enter.
  @Accessor(key: 'onClick')
  void Function(EmojiData emoji, SyntheticMouseEvent event) onEmojiClick;

  /// Callback fired when an emoji is selected.
  void Function(EmojiData emoji) onSelect;

  /// Callback fired when the skin is changed.
  void Function(String skin) onSkinChange;

  /// Number of emojis per line. While there’s no minimum or
  /// maximum, this will affect the picker’s width. This will
  /// set Frequently Used length as well (perLine * 4).
  ///
  /// Default: `9`
  int perLine;

  /// An object containing localized strings
  /// TODO: Provide typed JSObject.
  dynamic i18n;

  /// Renders the native unicode emoji.
  ///
  /// Default: `false`
  bool native;

  /// The emoji set: 'apple', 'google', 'twitter', 'facebook'.
  ///
  /// Default: `apple`
  String set;

  /// The picker theme: 'auto', 'light', 'dark'.
  ///
  /// Default: `light`
  String theme;

  /// The emoji sheet size: 16, 20, 32, 64.
  ///
  /// Default: `64`
  int sheetSize;

  /// A Fn that returns that image sheet to use for emojis.
  /// Useful for avoiding a request if you have the sheet locally.
  String Function(String set, int sheetSize) backgroundImageFn;

  /// A Fn to choose whether an emoji should be displayed or not
  bool Function(EmojiData emoji) emojisToShowFilter;

  /// Display preview section.
  ///
  /// Default: `true`
  bool showPreview;

  /// Display skin tones picker. Disable both this and
  /// showPreview to remove the footer entirely.
  ///
  /// Default: `true`
  bool showSkinTones;

  /// Show emojis short name when hovering (title).
  ///
  /// Default: `false`
  bool emojiTooltip;

  /// When clickable, render emojis with a <button>.
  /// Some browsers have issues rendering certain emojis on
  /// a button, so you might want to disable this. It is
  /// better for accessibility to use buttons.
  ///
  /// Default: `true`
  bool useButton;

  /// Forces skin color: 1, 2, 3, 4, 5, 6.
  int skinColor;

  /// Default skin color: 1, 2, 3, 4, 5, 6
  ///
  /// Default: `1`
  int defaultSkin;

  /// The emoji used to pick a skin tone.
  /// Uses an emoji-less skin tone picker by default.
  String skinEmoji;

  /// The title shown when no emojis are hovered.
  ///
  /// Default: `Emoji Mart™`
  String title;

  /// The emoji shown when there are no search results.
  ///
  /// Default: `sleuth_or_spy`
  String notFoundEmoji;

  /// Optional React component shown when there are no results.
  dynamic notFound;

  /// Custom icons.
  ///
  /// TODO: type this.
  dynamic icons;
}

@JS('EmojiMart.Picker')
external ReactClass get _jsPicker;
