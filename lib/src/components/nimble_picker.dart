@JS()
library emoji_mart.src.nimble_picker;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';
import 'package:over_react/over_react.dart';

import '../util/js_component.dart';
import 'picker.dart';

part 'nimble_picker.over_react.g.dart';

/// OverReact bindings for the emoji-mart `Picker` JS component.
UiFactory<NimblePickerProps> NimblePicker = uiJsComponent<NimblePickerProps>(
  ReactJsComponentFactoryProxy(_jsNimblePicker),
  _$NimblePickerConfig, // ignore: undefined_identifier
);

@Props(keyNamespace: '')
mixin NimblePickerPropsMixin on UiProps {
  @requiredProp
  Map<String, dynamic> data;
}

/// The concrete props class for the [NimblePicker] component.
class NimblePickerProps = UiProps with NimblePickerPropsMixin, PickerPropsMixin;

@JS('EmojiMart.NimblePicker')
external ReactClass get _jsNimblePicker;
