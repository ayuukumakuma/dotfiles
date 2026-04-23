# budoux.lua

A Lua port of [BudouX](https://github.com/google/budoux) — the machine learning powered line break organizer tool.

BudouX uses a compact ML model to find natural word boundaries in CJK text, producing more readable line breaks than character-level splitting.

English | [日本語](README.ja.md) | [简体中文](README.zh-hans.md) | [繁體中文](README.zh-hant.md) | [ภาษาไทย](README.th.md)

## Installation

### LuaRocks

```bash
luarocks install budoux
```

### lazy.nvim (Neovim)

```lua
{ "delphinus/budoux.lua" }
```

### Manual

Copy the `lua/budoux/` directory into your Lua package path.

## Usage

```lua
local budoux = require("budoux")

-- Create a parser for your language
local parser = budoux.load_default_japanese_parser()

-- Split text into natural phrases
local chunks = parser:parse("今日は天気がいいから散歩しましょう。")
-- → { "今日は", "天気が", "いいから", "散歩しましょう。" }

-- Simplified Chinese
local zh_hans = budoux.load_default_simplified_chinese_parser()
zh_hans:parse("我们的使命是整合全球信息，供大众使用，让人人受益。")
-- → { "我们", "的", "使命", "是", "整合", "全球", "信息，", "供", "大众", "使用，", "让", "人", "人", "受益。" }

-- Traditional Chinese
local zh_hant = budoux.load_default_traditional_chinese_parser()
zh_hant:parse("我們的使命是匯整全球資訊，供大眾使用，使人人受惠。")
-- → { "我們", "的", "使命", "是", "匯整", "全球", "資訊，", "供", "大眾", "使用，", "使", "人", "人", "受惠。" }

-- Thai
local th = budoux.load_default_thai_parser()
th:parse("ภารกิจของเราคือการจัดระเบียบข้อมูลของโลก")
-- → { "ภาร", "กิจ", "ของ", "เรา", "คือ", "การ", "จัดระเบียบ", "ข้อมูล", "ของ", "โลก" }

-- Custom model
local parser = budoux.Parser.new(your_model_table)
```

## API

### `budoux.load_default_japanese_parser()`

Returns a `Parser` for Japanese.

### `budoux.load_default_simplified_chinese_parser()`

Returns a `Parser` for Simplified Chinese.

### `budoux.load_default_traditional_chinese_parser()`

Returns a `Parser` for Traditional Chinese.

### `budoux.load_default_thai_parser()`

Returns a `Parser` for Thai.

### `budoux.Parser.new(model)`

Create a `Parser` from a custom model table.

- `model` — a table with feature weight tables (`UW1`–`UW6`, `BW1`–`BW3`, `TW1`–`TW4`) and `base_score`

### `parser:parse(text)`

Parse text into chunks using the BudouX model.

- `text` — input text string
- Returns: `string[]` — array of phrase chunks

## Available Models

| Model | Loader | Language |
|---|---|---|
| Japanese | `load_default_japanese_parser()` | Japanese |
| Simplified Chinese | `load_default_simplified_chinese_parser()` | Simplified Chinese |
| Traditional Chinese | `load_default_traditional_chinese_parser()` | Traditional Chinese |
| Thai | `load_default_thai_parser()` | Thai |

## Comparison with atusy/budoux.lua

There is another Lua port of BudouX: [atusy/budoux.lua](https://github.com/atusy/budoux.lua). Key differences:

| | delphinus/budoux.lua | atusy/budoux.lua |
|---|---|---|
| API style | Parser object (`parser:parse(text)`) | Function-based (`budoux.parse(model, text)`) |
| Languages | Japanese, Simplified Chinese, Traditional Chinese, Thai | Japanese only |
| Dependencies | None (pure Lua) | lpeg or Neovim |
| Tests / CI | busted + GitHub Actions (Lua 5.1–5.4, LuaJIT) | None |

## License

Apache-2.0 — see [LICENSE](LICENSE).

This project is a Lua port of [BudouX](https://github.com/google/budoux) (Copyright 2021 Google LLC, Apache-2.0). See [NOTICE](NOTICE) for details.

<!-- vim: set ft=markdown: -->