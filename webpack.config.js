const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: './index.js',
  output: {
    filename: 'emoji-mart.min.js',
    library: 'EmojiMart',
    path: path.resolve(__dirname, 'lib/'),
  }
};
