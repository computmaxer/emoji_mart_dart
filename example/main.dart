import 'dart:html';
import 'dart:js_util';

import 'package:emoji_mart/emoji_mart.dart';
import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;

void main() {
  react_dom.render(ExampleComponent({}), querySelector('#picker'));
}

var ExampleComponent = react.registerComponent2(() => new _ExampleComponent());

class _ExampleComponent extends react.Component2 {
  get initialState => {
        'pickerOpen': false,
        'selectedEmoji': null,
      };

  handleBtnClick(_) {
    this.setState({
      'pickerOpen': !state['pickerOpen'],
    });
  }

  handleEmojiSelection(emoji, event) {
    window.console.log(emoji);
    this.setState({'selectedEmoji': emoji, 'pickerOpen': false});
  }

  render() {
    return react.div({}, [
      react.div({
        'key': '1'
      }, [
        react.button({'key': 'btn', 'onClick': handleBtnClick}, 'Picker'),
        react.span({'key': 'selection'}, " Selection: "),
        if (state['selectedEmoji'] != null)
          Emoji({
            'key': 'emoji',
            'emoji': getProperty(state['selectedEmoji'], 'id'),
            'set': 'google',
            'size': 16
          }),
      ]),
      if (state['pickerOpen'])
        Picker(
            {'key': 'picker', 'set': 'google', 'onClick': handleEmojiSelection},
            []),
    ]);
  }
}
