# 異種航員 綿羊漢化 非機翻 <br> Xenonauts Chinese Translation #

適用於 異種航員 社群增強版。翻譯包括所有預設啟用的社群版模組，及少量其他模組。工事中。

遊戲的原生介面是為 1920x1080 而設，不擅於適應其他解像度。本漢化也以此解像度為準。

For community edition. Includes translation of default enabled X:CE mods and some more. Work In Progress.

The game's native interface is designed for 1920x1080, and does not handle other resolution well.
This translation also use it as a standard.

## 安裝 Install ##

1. 確保遊戲為社群版 0.34.2 （或以上），而非原版的 1.xx。 <br> Make sure game is Community Edition 0.34.2 (or up), NOT normal version 1.xx.
2. 將 `mod_xce_zh` 目錄中的 `font`、`launcher`、`splashscreen` 目錄制到 `遊戲目錄/assets`，需覆蓋遊戲的六個檔案。 <br> Copy `font`, `launcher`, and `splashscreen` folders in `mod_xce_zh` to `Xenonauts/assets`, overwriting 6 files.
3. 將 `mod_xce_zh` 目錄中的 所有 .xml 檔案壓成 zip。 <br> Zip all .xml files in `mod_xce_zh` folder.
4. 用擴展管理器安裝這 zip，置於所有模組之上。 <br> Install the zip as mod and place above all mods.

## 進度 Progress ##

* [x] Translate UI strings (strings.xml)
* [x] Translate Xenopedia (xenopedia.xml)
* [x] Translate Male Soldier names (soldiernames.xml)
* [x] Translate Female Soldier names (soldiernamesfemale.xml)
* [x] Translate custom solider and regiment (strings.xml)
* [x] Add and translate mod contents (Lore+ and others)
* [x] Translate Quickstart and Manual
* [x] Playtest - Adjust font sizes
* [x] Playtest - Fill in uncertain blanks
* [x] Translate splashscreen, launcher, buttons
* [ ] Build font and preview package
* [ ] Edit strings.xml
* [x] Edit Xenopedia.xml
* [x] Edit solider names
* [ ] Update doc screenshot
* [ ] Release

## 關聯模組 Relevant Mods ##

XCE mods with translate-able resources.

* Armoured Assault
  * Ver 1.2, default off.
  * Merged and translated.

* Extended Weapon Descriptions for Fighters
  * Ver 1.0.1, default on.
  * Merged and translated.

* Furies, Terror, and Dreadnoughts Oh My
  * Default off.
  * Must be done as a separate translation mod.

* Lore+
  * Ver 1.1c3, default on.
  * Merged and translated.

* X:CE Balance Adjustment
  * Ver 0.34.2, default on.
  * Merged and translated.

* X:CE Settings
  * Ver 0.34.2, default on.
  * Ignored because it simply swaps colonal and commander title, which is sharp and clear in Chinese.

* Xenonauts Fix Pack
  * Ver 1.36, default on.
  * Ignored because its typo and grammer fix to Lore+ applies only to English.

Non-XCE mods with translate-able resoruces.

* Aegis Armor
  * Ver 2014-08-18.
  * Merged and translated.

* Fire in the Hole
  * Ver 3.1.
  * Merged and translated.

* Geographic addition
  * Ver 1.1 / 2016-08-16.
  * Merged and translated.

## 字型 Fonts ##

本翻譯所用的字型皆為開源字型，可以自由轉換格式。

All fonts are open source and can be transformed freely.

* arial.mvec
  * Replace with WenQuanYi Micro Hei (文泉驛微米黑).
  * Select underscore (half-width), Move Y 4000, and use it as non-breaking space.
  * Whole font is exported to support custom names.
* xenonauts.mvec
  * Em size 1000 => 820, Scale 150% (width no change), Scale width 150%, Move Y 72.
  * Merge with cwTeXQYuan (cwTeX 圓體, Em size 1024), Delete merged half-width symbols.
  * Whole font is exported to support custom names.
* xenopedia.mvec
  * Replace with AR PL MingTi (文鼎 PL 明體).
  * Select underscore (half-width), Move Y 2000, and use it as non-breaking space.
  * All Xenopedos characters + English & Punctuation.