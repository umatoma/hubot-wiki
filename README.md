# hubot-wiki

A hubot script for searching wikipedia

See [`src/wiki.coffee`](src/wiki.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install git://github.com/umatoma/hubot-wiki.git --save`

Then add **hubot-wiki** to your `external-scripts.json`:

```json
["hubot-wiki"]
```

## Sample Interaction

```
user> hubot wiki me Node.js
bot> 【Node.js】
Node.js はイベント化された入出力を扱うUnix系プラットフォーム上のサーバーサイドJavaScript環境である（V8 JavaScriptエンジンで動作する）。Webサーバなどのスケーラブルなネットワークプログラムの記述を意図している。
https://ja.wikipedia.org/wiki/Node.js
```