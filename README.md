## emoji_mart_dart

A Dart wrapper for the popular [Emoji-Mart](https://github.com/missive/emoji-mart) react components.

**Sample Usage**

```dart
(Picker()
  ..set = 'twitter'
  ..theme = 'auto'
  ..showPreview = false
  ..showSkinTones = false
  ..onSelect = handleEmojiSelection)()
```

```dart
(Emoji()
  ..emoji = 'grinning'
  ..set = 'google'
  ..size = 16)()
```
