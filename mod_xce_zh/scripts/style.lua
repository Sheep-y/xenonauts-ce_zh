kIllegalNameChars = "!@#$%^&*()><\\\"[]{}|?/+=~`,;:";

BlackColor          = Color(0,0,0,255);
BlackColor75A       = Color(0,0,0,192);
BlackColor50A       = Color(0,0,0,128);
BlackColor25A       = Color(0,0,0,64);
BlueColor           = Color(77,115,178,255);
RedColor            = Color(255,0,0,255);
DarkBlueColor       = Color(40,60,120,255);
WhiteColor          = Color(255,255,255,255);
WhiteColor75A       = Color(255,255,255,192);
WhiteColor50A       = Color(255,255,255,128);
WhiteColor25A       = Color(255,255,255,64);
MenuButtonFontColor = Color(255,255,255,255);
GreenColor          = Color(0,255,0,255);
YellowColor         = Color(253,232,2,255);
MinProgress         = Color(255,0,0,255);
ProgressBG          = Color(128,128,128,255);
BlueLinkColor       = Color(2,66,112,225);
BackgroundTextColor = Color(196,162,99,255);
OrangeTextColor     = Color(206,162,31,255);
BaseTextColor       = Color(196,162,99,255);
DarkOrangeTextColor = Color(192,101,12,255);
ElementOutline      = Color(76,74,75,255);
XenopediaGrey       = Color(114,113,113,255);
BarGrey             = Color(99,99,99,255);
BarLightGrey        = Color(160,160,160,255);
VEQstatColor        = Color(58,58,58,255);
MainMenuWhiteColor  = Color(255,255,255,180);

GeoscapeFont  = "fonts/xenonauts.mvec";
XenopediaFont = "fonts/xenopedia.mvec";
Tahoma        = "fonts/tahoma.mvec";

DefaultStyle = {
  font = GeoscapeFont
};

XenonautsDisabledFont = {
  GeoscapeFont,
  0,
  WhiteColor
};

NewUI_TopbarLarge = { -- Screen name in top left corner
  GeoscapeFont,
  22, -- originally 21.5
  WhiteColor
};
NewUI_TopbarLargeBlack = { -- Name of base at top of magement screens
  GeoscapeFont,
  22, -- originally 21.5
  BlackColor
};

NewUI_TopbarSmall = { -- small text in top bar, like build base button or base region
  GeoscapeFont,
  16, -- originally 12
  WhiteColor
};

GeoscapeCity = { -- geoscape city names
  GeoscapeFont,
  16, -- originally 10
  WhiteColor
};

XenopediaStat = { -- stat text in Xenopedia
  GeoscapeFont,
  14, -- originally 12
  XenopediaGrey
};

XenopediaMain = { -- used in explainary tooltops, such as mission objectives, in addition to xenopedia main text
  XenopediaFont,
  14, -- originally 12
  WhiteColor
};

XenopediaStatsHeader = { -- Xenopedia subtitle in top right
  GeoscapeFont,
  18, -- originally 18
  WhiteColor
};

XenopediaPopUp = { -- Unused?
  Tahoma,
  22, -- originally 22
  WhiteColor
};

XenonautsLabelFontTiny = { -- Unused?
  GeoscapeFont,
  12, -- originally 8
  WhiteColor
};

XenonautsLabelFontTinyYellow = { -- Unused?
  GeoscapeFont,
  12, -- originally 8
  YellowColor
};

XenonautsLabelFontMini = { -- Description text of engage and autoresolve dialog
  GeoscapeFont,
  14, -- originally 10
  WhiteColor
};

XenonautsLabelFontMini50A = { -- Unused?
  GeoscapeFont,
  12, -- originally 10
  WhiteColor50A
};

XenonautsLabelFontMiniBackground = { -- Unused?
  GeoscapeFont,
  12, -- originally 9
  BackgroundTextColor
};

XenonautsLabelFontMiniBackgroundOrange = { -- Used in "airplanemaintenance.lua", not sure what it is
  GeoscapeFont,
  12, -- originally 9
  BaseTextColor
};

XenonautsLabelFontMiniBackgroundWhite = { -- Unused?
  GeoscapeFont,
  12, -- originally 9
  WhiteColor
};

XenonautsLabelFontSmall = { -- Airplane listing in engage and autoresolve dialog, region list in funding dialog,  plus ""
  GeoscapeFont,
  12, -- originally 9
  WhiteColor
};

XenonautsLabelFontSmallBlack = { -- Top 6 options in option pane
  GeoscapeFont,
  13, -- originally 12
  BlackColor
};

XenonautsLabelFontWhite11 = { -- Text of many geo notice box, e.g. low fuel, research done, building complete, air force take down ufo etc.
  GeoscapeFont,
  16, -- originally 12
  WhiteColor
};

XenonautsLabelFontSmallStatbar = { -- Numbers of carrying weight and TU.
  GeoscapeFont,
  10, -- originally 10, anything larger will cause number to disappear
  WhiteColor
};

XenonautsLabelFontMedium = { -- Button text of geoscape notices
  GeoscapeFont,
  16, -- originally 14
  WhiteColor
};

XenonautsLabelFontMediumBlack = { -- Has numerous references but can't verify any!
  GeoscapeFont,
  16, -- originally 14
  BlackColor
};

XenonautsLabelFontMediumPlus = { -- Title of intercept/engage/resolve dialog
  GeoscapeFont,
  20, -- originally 16
  WhiteColor
};

XenonautsLabelFontMediumPlusBlack = { -- Unused?
  GeoscapeFont,
  16, -- originally 16
  BlackColor
};

XenonautsLabelFontMediumOrange = { -- Orange list text in various dialogs (ufo stats, site stats, research done, new manufacture options, ground combat soldier stat etc.)
  GeoscapeFont,
  14, -- originally 11, ufo stat will disappear if > 14
  OrangeTextColor
};

XenonautsLabelFont14Orange = { -- Unused?
  GeoscapeFont,
  16, -- originally 14
  OrangeTextColor
};

XenonautsLabelFontMediumRed = { -- Unused and duplicated in line 290
  GeoscapeFont,
  16, -- originally 14
  RedColor
};

MenuElementHeader = { -- Unused?
  GeoscapeFont,
  14, -- originally 11
  WhiteColor
};

MenuElementHeaderBlack = { -- Used in "timer dialog".
  GeoscapeFont,
  14, -- originally 11
  BlackColor
};

MainMenuButton = { -- Home screen buttons and difficulty screen buttons
  GeoscapeFont,
  22, -- originally 20
  BlackColor
};

MainMenuButtonWhite = { -- Difficulty descriptions
  GeoscapeFont,
  30, -- originally 20
  MainMenuWhiteColor
};

MainMenuDesc = { -- Unused?
  GeoscapeFont,
  12, -- originally 10
  BlackColor
};

MainMenuOption = { -- Unused?
  GeoscapeFont,
  14, -- originally 12
  BlackColor
};

MenuElementSubHeading = { -- Plane list in intercept dialog
  GeoscapeFont,
  14, -- originally 10
  WhiteColor
};

EventFeedFont = { -- Geoscape news feed
  GeoscapeFont,
  12, -- originally 10
  Color( 78, 97, 103, 255 )
};

MenuElementSubHeadingBlack = { -- Project list in lab and workshop, independent size
  GeoscapeFont,
  10, -- originally 10
  BlackColor
};

MediumSoldier = { -- Base list in transfer dialogs
  GeoscapeFont,
  16, -- originally 11
  WhiteColor
};

MediumSoldierBlack = { -- Xenopedia close button
  GeoscapeFont,
  16, -- originally 11
  BlackColor
};

MedSmallSoldier = { -- Label of soldier equipment slots
  GeoscapeFont,
  11, -- originally 10, box clipped
  WhiteColor
};

MedSmallSoldierOrange = { -- Item move cost in ground combat inventory screen
  GeoscapeFont,
  14, -- originally 10
  OrangeTextColor
};

SmallSoldier = { -- Unused?
  GeoscapeFont,
  12, -- originally 8
  WhiteColor
};

XenonautsLabelFontMediumBlack = { -- Home screen button subtitle, home page load game list, save load text boxes, equipment screen armour box label and role equip text
  GeoscapeFont,
  16, -- originally 14
  BlackColor
};

XenonautsLabelFontMediumRed = { -- Unused?
  GeoscapeFont,
  14, -- originally 14
  RedColor
};

XenonautsLabelFontMedium25A = { -- Unused?
  GeoscapeFont,
  14, -- originally 14
  WhiteColor25A
};

XenonautsLabelFontLarge = { -- Somewhere in soldier screen? Can't confirm.
  GeoscapeFont,
  24, -- originally 24
  WhiteColor
};

XenonautsLabelFontLargeBlack = { -- Unused?
  GeoscapeFont,
  24, -- originally 24
  BlackColor
};

XenonautsLabelFontExtra = { -- "Xenopedia" title
  GeoscapeFont,
  28, -- originally 28
  WhiteColor
};

XenonautsLabelFontBG = { -- Unused?
  GeoscapeFont,
  12, -- originally 12
  WhiteColor25A
};

XenonautsButtonFontSmall = { -- Geoscape ufo/plane/crash/terror labels
  GeoscapeFont,
  16, -- originally 11
  WhiteColor
};

XenonautsButtonFontMedium = { -- No idea
  GeoscapeFont,
  14, -- originally 14
  WhiteColor
};

XenonautsButtonFontLarge = { -- No idea
  GeoscapeFont,
  20, -- originally 20
  WhiteColor
};

XenonautsEditFontTiny = { -- Unused and duplcated below?
  GeoscapeFont,
  12, -- originally 8
  BlackColor
};

XenonautsEditFontTiny = { -- Unused and duplcated above?
  GeoscapeFont,
  12, -- originally 8
  BlueColor
};

XenonautsEditFontMini = { -- Unused?
  GeoscapeFont,
  12, -- originally 10
  BlackColor
};

XenonautsEditFontMiniBlue = { -- No idea
  GeoscapeFont,
  12, -- originally 9
  BlueLinkColor
};

XenonautsEditFontSmall = { -- Unused?
  GeoscapeFont,
  12, -- originally 12
  BlackColor
};

XenonautsEditFontMedium = { -- Base name input box
  GeoscapeFont,
  16, -- originally 14
  OrangeTextColor
};

XenonautsGSFontWBG = { -- Geoscape base labels
  GeoscapeFont,
  16, -- originally 12
  BlackColor
};

XenonautsGSFontWoBG = { -- Geoscape waypoint labels
  GeoscapeFont,
  14, -- originally 11
  WhiteColor50A
};

XenonautsNavBarButtonGraphics = {
  "uitextures/navbarbuttonup",
  "uitextures/navbarbuttondown",
  "uitextures/navbarbuttonover",
};

XenonautsNavBarToggleButtonGraphics = {
  "uitextures/navbarbuttonup",
  "uitextures/navbarbuttondown",
  "uitextures/navbarbuttonover",
  "uitextures/navbarbuttonover",
};

XenonautsNavBarButton2Graphics = {
  "uitextures/navbarbutton2up",
  "uitextures/navbarbutton2down",
  "uitextures/navbarbutton2over",
};

XenonautsNavBarToggleButton2Graphics = {
  "uitextures/navbarbutton2up",
  "uitextures/navbarbutton2down",
  "uitextures/navbarbutton2over",
  "uitextures/navbarbutton2over",
};

XenonautsMenuButtonGraphics = {
  "uitextures/menubuttonup",
  "uitextures/menubuttondown",
  "uitextures/menubuttonover",
};

XenonautsHumanBaseButtonGraphics = {
  "uitextures/humanbasebuttonup",
  "uitextures/humanbasebuttondown",
  "uitextures/humanbasebuttonover",
};

XenonautsCityButtonGraphics = {
  "uitextures/humancitybuttonup",
  "uitextures/humancitybuttondown",
  "uitextures/humancitybuttonover",
};

XenonautsCityTerrorButtonGraphics = {
  "uitextures/humancityTbuttonup",
  "uitextures/humancityTbuttondown",
  "uitextures/humancityTbuttonover",
};

XenonautsUFOButtonGraphics = {
  "uitextures/ufobuttons/UFO_VerySmall",
  "uitextures/ufobuttons/UFO_VerySmall_over",
  "uitextures/ufobuttons/UFO_VerySmall_over",
};

XenonautsCSButtonGraphics = {
  "uitextures/csbuttonup",
  "uitextures/csbuttondown",
  "uitextures/csbuttonover",
};

XenonautsABButtonGraphics = {
  "uitextures/abbuttonup",
  "uitextures/abbuttondown",
  "uitextures/abbuttonover",
};

XenonautsSMButtonGraphics = {
  "uitextures/tsbuttonup",
  "uitextures/tsbuttondown",
  "uitextures/tsbuttonover",
};

XenonautsRoleButtonGraphics = {
  "uitextures/roles/commando",
  "uitextures/roles/commando",
  "uitextures/roles/commando",
};

XenonautsIceptorButtonGraphics = {
  "uitextures/interceptorbuttonup",
  "uitextures/interceptorbuttondown",
  "uitextures/interceptorbuttonover",
};

XenonautsWaypointButtonGraphics = {
  "uitextures/waypointbuttonup",
  "uitextures/waypointbuttondown",
  "uitextures/waypointbuttonover",
};

XenonautsGSButtonGraphics = {
  "uitextures/gsbuttonup",
  "uitextures/gsbuttondown",
  "uitextures/gsbuttonover",
};

XenonautsBaseCTRButtonGraphics = {
  "uitextures/bvctrbuttonup",
  "uitextures/bvctrbuttondown",
  "uitextures/bvctrbuttonover",
};

XenonautsBaseTNButtonGraphics = {
  "uitextures/basetnbuttonup",
  "uitextures/basetnbuttondown",
  "uitextures/basetnbuttonover",
  "uitextures/basetnbuttondownover",
};

XenonautsAddButtonGraphics = {
  "ui_screens/ui_stores/arrow_add_up",
  "ui_screens/ui_stores/arrow_add_down",
  "ui_screens/ui_stores/arrow_add_over",
};

XenonautsRemButtonGraphics = {
  "ui_screens/ui_stores/arrow_rem_up",
  "ui_screens/ui_stores/arrow_rem_down",
  "ui_screens/ui_stores/arrow_rem_over",
};

XenonautsCancelButtonGraphics = {
  "ui_screens/ui_research/stores_buttonup",
  "ui_screens/ui_research/stores_buttondown",
  "ui_screens/ui_research/stores_buttonover",
};

XenonautsTechTreeButtonGraphics = {
  "uitextures/expbuttonup",
  "uitextures/expbuttondown",
  "uitextures/expbuttonover",
};

XenonautsCheckBoxGraphics = {
  "uitextures/checkboxup",
  "uitextures/checkboxdown",
  "uitextures/checkboxover",
  "uitextures/checkboxdownover",
};

XenonautsCheckBoxGraphicsBlack = {
  "uitextures/checkboxupblack",
  "uitextures/checkboxdownblack",
  "uitextures/checkboxoverblack",
  "uitextures/checkboxdownoverblack",
};

XenonautsTiledButtonGraphics = {
  "uitextures/buttonframeup",
  "uitextures/buttonframedown",
  "uitextures/buttonframeover",
};

XenonautsTiledButtonGraphicsMenu = {
  "uitextures/buttonframeup_menu",
  "uitextures/buttonframedown_menu",
  "uitextures/buttonframeover_menu",
};

XenonautsTiledButtonGraphicsXenopedia = {
  "ui_screens/xenopedia/buttonframeup",
  "ui_screens/xenopedia/buttonframedown",
  "ui_screens/xenopedia/buttonframeover",
};

XenonautsTiledButton2Graphics = {
  "uitextures/gsdialog/buttonframeup",
  "uitextures/gsdialog/buttonframedown",
  "uitextures/gsdialog/buttonframeover",
};

XenonautsTiledButton3Graphics = {
  "uitextures/gsdialog/blue_buttonframeup",
  "uitextures/gsdialog/blue_buttonframedown",
  "uitextures/gsdialog/blue_buttonframeover",
};

XenonautsTransparentTiledButtonGraphics = {
  "uitextures/tpbuttonframeup",
  "uitextures/tpbuttonframedown",
  "uitextures/tpbuttonframeover",
};

XenonautsTransparentTiledButtonGraphicsWhite = {
  "uitextures/tpbuttonframeupwhite",
  "uitextures/tpbuttonframedownwhite",
  "uitextures/tpbuttonframeoverwhite",
};

XenonautsInvisibleTiledButtonGraphics = {
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
};

XenonautsTransparentTiledComboButtonGraphics = {
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
};

XenonautsTransparentTiledComboButtonGraphicsWhite = {
  "uitextures/tpbuttonframeupwhite",
  "uitextures/tpbuttonframedownwhite",
  "uitextures/tpbuttonframeoverwhite",
  "uitextures/tpbuttonframedownoverwhite",
};

XenonautsArmourComboButtonGraphics = {
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
};

XenonautsPrevSoldierButtonGraphics = {
  "uitextures/prewsoldierbuttonup",
  "uitextures/prewsoldierbuttondown",
  "uitextures/prewsoldierbuttonover",
};

XenonautsNextSoldierButtonGraphics = {
  "uitextures/nextsoldierbuttonup",
  "uitextures/nextsoldierbuttondown",
  "uitextures/nextsoldierbuttonover",
};

XenonautsTabFrameButtonGraphics = {
  "uitextures/tabframeup",
  "uitextures/tabframedown",
  "uitextures/tabframeover",
  "uitextures/tabframedownover",
};

XenonautsTechTreeGroupButtonGraphics = {
  "uitextures/techbuttonup",
  "uitextures/techbuttondown",
  "uitextures/techbuttonover",
  "uitextures/techbuttondownover",
};

XenonautsTechTreeGroupButtonDisabledGraphics = {
  "uitextures/techbuttondisabled",
  "uitextures/techbuttondisabled",
  "uitextures/techbuttondisabled",
  "uitextures/techbuttondisabled",
};

XenonautsTechTreeGroupArrowButtonGraphics = {
  "uitextures/techbuttonarrowup",
  "uitextures/techbuttonarrowdown",
  "uitextures/techbuttonarrowover",
  "uitextures/techbuttonarrowdownover",
};

XenonautsTechTreeGroupArrowButtonDisabledGraphics = {
  "uitextures/techbuttonarrowdisabled",
  "uitextures/techbuttonarrowdisabled",
  "uitextures/techbuttonarrowdisabled",
  "uitextures/techbuttonarrowdisabled",
};

XenonautsInterceptorButtonGraphics = {
  "uitextures/interceptorup",
  "uitextures/interceptordown",
  "uitextures/interceptorover",
};

XenonautsAIDebugButtonGraphics = {
  "uitextures/interceptorover",
  "uitextures/interceptordown",
  "uitextures/interceptorover",
};

XenonautsScrollLeftButtonGraphics = {
  "uitextures/scrollleft",
  "uitextures/scrollleft_down",
  "uitextures/scrollleft_over",
};

XenonautsScrollRightButtonGraphics = {
  "uitextures/scrollright",
  "uitextures/scrollright_down",
  "uitextures/scrollright_over",
};

XenonautsVehicleSlotButtonGraphics = {
  "uitextures/weaponframe2",
  "uitextures/weaponframe2",
  "uitextures/weaponframe2",
};

XenonautsSoldierStatColumnButtonGraphics = {
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
  "uitextures/transparent",
};

XenonautsAirCombatPauseButtonGraphics = {
  "uitextures/cspauseup",
  "uitextures/cspausedown",
  "uitextures/cspauseover",
};

XenonautsAirCombatPlayButtonGraphics = {
  "uitextures/csplayup",
  "uitextures/csplaydown",
  "uitextures/csplayover",
};

XenonautsAirCombatActionButtonGraphics = {
  "uitextures/accommandbuttonup",
  "uitextures/accommandbuttondown",
  "uitextures/accommandbuttonover",
};

XenonautsAirCombatActionCheckboxGraphics = {
  "uitextures/accommandbuttonup",
  "uitextures/accommandbuttondown",
  "uitextures/accommandbuttonover",
  "uitextures/accommandbuttondownover",
};

XenonautsTimerButtonGraphics = {
  "uitextures/timerbutton_off",
  "uitextures/timerbutton_on",
  "uitextures/timerbutton_on",
  "uitextures/timerbutton_on",
};

XenonautsSpeedButtonStyle = {
  parent   = DefaultStyle,
  font     = GeoscapeFont,
  sound    = kDefaultButtonSound,
  type     = kRadio,
};

XenonautsNavBarButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontSmall,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsNavBarButtonGraphics,
};

XenonautsNavBarToggleButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsNavBarToggleButtonGraphics,
};

XenonautsNavBarButton2Style = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontSmall,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsNavBarButton2Graphics,
};

XenonautsNavBarToggleButton2Style = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontSmall,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsNavBarToggleButton2Graphics,
};

XenonautsManBarButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontSmall,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsNavBarButtonGraphics,
};

XenonautsManBarRadioButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontSmall,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsNavBarToggleButtonGraphics,
};

XenonautsMenuButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsMenuButtonGraphics,
};

XenonautsHumanBaseButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsHumanBaseButtonGraphics,
};

XenonautsCityButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsCityButtonGraphics,
};

XenonautsCityButtonTerrorStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsCityTerrorButtonGraphics,
};

XenonautsUFOButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsUFOButtonGraphics,
};

XenonautsCSButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsCSButtonGraphics,
};

XenonautsABButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsABButtonGraphics,
};

XenonautsSMButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsSMButtonGraphics,
};

XenonautsIceptorButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsIceptorButtonGraphics,
};

XenonautsWaypointButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsWaypointButtonGraphics,
};

XenonautsGSButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsGSButtonGraphics,
};

XenonautsBaseCTRButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontLarge,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsBaseCTRButtonGraphics,
};

XenonautsBaseTNButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsBaseTNButtonGraphics,
};

XenonautsAddButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsAddButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsRemButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsRemButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsCancelButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsCancelButtonGraphics,
};

XenonautsTechTreeGroupButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTechTreeGroupButtonGraphics,
};

XenonautsTechTreeGroupButtonDisabledStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTechTreeGroupButtonDisabledGraphics,
};

XenonautsTechTreeGroupArrowButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTechTreeGroupArrowButtonGraphics,
};

XenonautsTechTreeGroupArrowButtonDisabledStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTechTreeGroupArrowButtonDisabledGraphics,
};

XenonautsTechTreeButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTechTreeButtonGraphics,
  font     = XenonautsButtonFontSmall,
};

XenonautsCheckBoxStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  font     = XenonautsButtonFontSmall,
  graphics = XenonautsCheckBoxGraphics,
};

XenonautsCheckBoxStyleBlack = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  font     = XenonautsButtonFontSmall,
  graphics = XenonautsCheckBoxGraphicsBlack,
};

XenonautsTiledButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTiledButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsTiledButtonStyleMenu = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTiledButtonGraphicsMenu,
  font     = XenonautsButtonFontLarge,
};

XenonautsTiledButtonStyleMenu2 = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTiledButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsTiledButtonStyleXenopedia = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTiledButtonGraphicsXenopedia,
  font     = XenonautsButtonFontLarge,
};

XenonautsTiledButton2Style = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTiledButton2Graphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsTiledButton3Style = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTiledButton3Graphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsTransparentTiledButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTransparentTiledButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsTransparentTiledButtonWhiteStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsTransparentTiledButtonGraphicsWhite,
  font     = XenonautsButtonFontLarge,
};

XenonautsTransparentTiledComboButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTransparentTiledComboButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsTransparentTiledComboButtonWhiteStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTransparentTiledComboButtonGraphicsWhite,
  font     = XenonautsButtonFontLarge,
};

XenonautsArmourComboButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsArmourComboButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsPrevSoldierButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsPrevSoldierButtonGraphics,
};

XenonautsNextSoldierButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsNextSoldierButtonGraphics,
};

XenonautsTabFrameButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsTabFrameButtonGraphics,
};

XenonautsToggleButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsTabFrameButtonGraphics,
};

XenonautsInvisibleTiledButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsInvisibleTiledButtonGraphics,
};

XenonautsInvisibleTiledToggleButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsInvisibleTiledButtonGraphics,
};

XenonautsInvisibleTiledRadioButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsInvisibleTiledButtonGraphics,
};

XenonautsInterceptorButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsInterceptorButtonGraphics,
};

XenonautsAIDebugButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsAIDebugButtonGraphics,
};

XenonautsSoldierStatColumnButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsSoldierStatColumnButtonGraphics,
};

XenonautsVehicleSlotButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsVehicleSlotButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsAirCombatPauseButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsAirCombatPauseButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsAirCombatPlayButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsAirCombatPlayButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsAirCombatActionButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsAirCombatActionButtonGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsAirCombatActionCheckboxStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kToggle,
  graphics = XenonautsAirCombatActionCheckboxGraphics,
  font     = XenonautsButtonFontLarge,
};

XenonautsInvisibleRadioButtonStyle = {
  parent   = DefaultStyle,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsTransparentTiledComboButtonGraphics,
};

XenonautsTimerButtonStyle = {
  parent   = DefaultStyle,
  font     = MenuElementHeaderBlack,
  sound    = kDefaultButtonSound,
  type     = kRadio,
  graphics = XenonautsTimerButtonGraphics,
};

XenonautsRoleButtonStyle = {
  parent   = DefaultStyle,
  font     = XenonautsButtonFontMedium,
  sound    = kDefaultButtonSound,
  type     = kPush,
  graphics = XenonautsRoleButtonGraphics,
};
