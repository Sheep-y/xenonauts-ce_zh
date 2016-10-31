# 異種航員 綿羊漢化 非機翻 <br> Xenonauts Chinese Translation #

適用於 異種航員 社群增強版。翻譯包括所有預設啟用的社群版模組，及少量其他模組。工事中。

遊戲的原生介面是為 1920x1080 而設，不擅於適應其他解像度。本漢化也以此解像度為準。

For community edition. Includes translation of default enabled X:CE mods and some more. Work In Progress.

The game's native interface is designed for 1920x1080, and does not handle other resolution well.
This translation also use it as a standard.

## 安裝方式 Install ##

目前的型屬預覽性質，有少量文字無法顯示。

1. 將 `mod_xce_zh/font` 目錄中的 .mvec 檔案複制到 `遊戲目錄/assets/fonts` <br> Copy .mvec files in `mod_xce_zh/font` folder to `Xenonauts/assets/fonts`
2. 將 `mod_xce_zh` 目錄中的 所有 .xml 檔案壓成 zip <br> Zip all .xml files in `mod_xce_zh` folder.
3. 用擴展管理器安裝這 zip，置於所有擴展之上 <br> Install the zip as mod and place above all other mods.

## 進度 Progress ##

* [x] Translate UI strings (strings.xml)
* [x] Translate Xenopedia (xenopedia.xml)
* [x] Translate Male Soldier names (soldiernames.xml)
* [x] Translate Female Soldier names (soldiernamesfemale.xml)
* [x] Translate custom solider and regiment (strings.xml)
* [x] Add and translate mod contents (Lore+ and others)
* [x] Update to X:CE 0.34.2
* [x] Translate Quickstart and Manual
* [ ] Playtest - Adjust font sizes
* [x] Playtest - Fill in uncertain blanks
* [ ] Update doc screenshot.
* [ ] Build font and preview package
* [ ] Translate splashscreen, launcher
* [ ] Edit strings.xml
* [ ] Edit Xenopedia.xml
* [ ] Edit solider names
* [ ] Proofreading
* [ ] Update doc screenshots
* [ ] Release

## 模組支援 Mod list ##

XCE mods with translate-able resources and status.

* Armoured Assault
  * Default Off
  * Merged and translated

* Extended Weapon Descriptions for Fighters
  * Default On
  * Merged and translated

* Furies, Terror, and Dreadnoughts Oh My
  * Default Off
  * Must be done as a separate translation mod.

* Khall's More Portraits
  * Default On
  * Would not work if soldiernames.xml is overridden, need to try to work with it.

* Lore+
  * Default On
  * Merged and translated

* X:CE Balance Adjustment
  * Default On
  * Merged and translated

* X:CE Settings
  * Default On
  * Ignored because it simply swaps colonal and commander title, which is sharp and clear in Chinese

Non-XCE mods with translate-able resoruces and status.

* Geographic addition
  * Version 1.1 released 2016-08-16
  * Merged and translated

## 字型 Fonts ##

本翻譯所用的字型皆為開放字型，可以自由轉換格式。

All fonts are open and can be transformed freely.

Planned and using for testing (not bundled in source):

* arial.mvec
  * Replace with WenQuanYi Micro Hei (文泉驛微米黑)
* xenonauts.mvec
  * Em size 1000 => 820, Scale 150% (width no change), Scale width 150%, Move Y 72
  * Merge with cwTeXQYuan (cwTeX 圓體, Em size 1024), Delete merged half-width symbols
* xenopedia.mvec
  * Replace with AR PL MingTi (文鼎 PL 明體)
  * Select underscore (half-width), Move Y 2000, and use it as non-breaking space.