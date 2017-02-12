require "scripts/style"

kIllegalCustChars = "!@#$%^&*()><\\\"\'[]{}|?/+=~`.,:-";

local topOptionFont = 1.1; -- Originally 1

MakeDialog
{
	OptionsWindow
	{
	  x = 0,
	  y = 0,
	  w = kMax,
	  h = kMax,

	  --image = "uitextures/transparent",
    bordersize = 2,

	hasExternalBorders = false, --!important!

    NonUniformScaledImage
    {
      x = 0,
      y = 0,
      w = kMax,
      h = 1,

  	  image = "uitextures/black",
  	  tint  = Black50A,
    },

    ScalingText
    {
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY * topOptionFont,
      label = "OptionsDialog.MouseSens",
    },
    ScalingText
    {
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ),
      w = kMax,
      h = kMax,
      fontScale = screenScaleY * topOptionFont,
      label = "OptionsDialog.KbdScrollSens",
    },
    ScalingText
    {
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ) * 2,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY * topOptionFont,
      label = "OptionsDialog.MusicVolume",
    },
    ScalingText
    {
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ) * 3,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY * topOptionFont,
      label = "OptionsDialog.SfxVolume",
    },

    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "mousesens",
      x = 150 * mmScaleX,
      y = 5,
      w = kMax - 5 - 10 * mmScaleX,
      h = 12 * screenScaleY,
      barheight = 12 * screenScaleY,
      min = 1,
      max = 20,
      barcolor = Color(0,153,60,255),
      bgimage  = "ui_screens/mainmenu/progress_bg",
      barimage = "ui_screens/mainmenu/progressbar",
      bgtilebordersize = 4,
      percent  = false,
      slider = true,

      command =
        function()
          OnSliderChange( 0 );
        end,
    },
    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "keysens",
      x = 150 * mmScaleX,
      y = 5 + Floor( 14 * screenScaleY ),
      w = kMax - 5 - 10 * mmScaleX,
      h = 12 * screenScaleY,
      barheight = 12 * screenScaleY,
      min = 1,
      max = 10,
      barcolor = Color(0,153,60,255),
      bgimage  = "ui_screens/mainmenu/progress_bg",
      barimage = "ui_screens/mainmenu/progressbar",
      bgtilebordersize = 4,
      percent  = false,
      slider = true,

      command =
        function()
          OnSliderChange( 1 );
        end,
    },
    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "musicvol",
      x = 150 * mmScaleX,
      y = 5 + Floor( 14 * screenScaleY ) * 2,
      w = kMax - 5 - 10 * mmScaleX,
      h = 12 * screenScaleY,
      barheight = 12 * screenScaleY,
      min = 0,
      max = 10,
      barcolor = Color(0,153,60,255),
      bgimage  = "ui_screens/mainmenu/progress_bg",
      barimage = "ui_screens/mainmenu/progressbar",
      bgtilebordersize = 4,
      percent  = false,
      slider = true,

      command =
        function()
          OnSliderChange( 2 );
        end,
    },
    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "sfxvol",
      x = 150 * mmScaleX,
      y = 5 + Floor( 14 * screenScaleY ) * 3,
      w = kMax - 5 - 10 * mmScaleX,
      h = 12 * screenScaleY,
      barheight = 12 * screenScaleY,
      min = 0,
      max = 10,
      barcolor = Color(0,153,60,255),
      bgimage  = "ui_screens/mainmenu/progress_bg",
      barimage = "ui_screens/mainmenu/progressbar",
      bgtilebordersize = 4,
      percent  = false,
      slider = true,

      command =
        function()
          OnSliderChange( 3 );
        end,
    },

    ScalingText
    {
      name = "v1",
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5,
      w = kMax - 5,
      h = kMax,
      fontScale = screenScaleY,
      label = "5",
      flags = kHAlignRight,
    },
    ScalingText
    {
      name = "v2",
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ),
      w = kMax - 5,
      h = kMax,
      fontScale = screenScaleY,
      label = "5",
      flags = kHAlignRight,
    },
    ScalingText
    {
      name = "v3",
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ) * 2,
      w = kMax - 5,
      h = kMax,
      fontScale = screenScaleY,
      label = "5",
      flags = kHAlignRight,
    },
    ScalingText
    {
      name = "v4",
      font = XenonautsLabelFontSmallBlack,
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ) * 3,
      w = kMax - 5,
      h = kMax,
      fontScale = screenScaleY,
      label = "5",
      flags = kHAlignRight,
    },


			ScalingText
        {
	        font = XenonautsLabelFontSmallBlack,
			x = 5,
			y = 5 + Floor( 14 * screenScaleY ) * 4,
			w = kMax,
			h = 14 * screenScaleY,
			fontScale = screenScaleY * topOptionFont,
			label = "OptionsDialog.TuReserveMode",
			flags  = kVAlignCenter,
			name = "label",
        },
      SetStyle( XenonautsInvisibleTiledToggleButtonStyle ),
      TiledButton
        {
          name = "TuReserveToggle",
          x = kMax - (24 * screenScaleY),
		  y = 5 + Floor( 14 * screenScaleY ) * 4,
          w = kMax,
		  h = 14 * screenScaleY,
  		bordersize = 2,
	    label = "MainMenuOn",
		offLabel = "MainMenuOff",
        font = XenonautsLabelFontSmallBlack,
        fontScale = screenScaleY * topOptionFont,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
	    outline = 2,
		  command =
			function()
				ToggleTuReserve();
			end,
        },
		ScalingText
	{
		font = XenonautsLabelFontSmallBlack,
		x = 5,
		y = 5 + Floor( 14 * screenScaleY ) * 5,
		w = kMax,
		h = 14 * screenScaleY,
		fontScale = screenScaleY * topOptionFont,
		label = "OptionsDialog.ShowStatsIncrements",
		flags  = kVAlignCenter,
		name = "label",
	},
      SetStyle( XenonautsInvisibleTiledToggleButtonStyle ),
      TiledButton
	{
	  name = "StatsIncrementsToggle",
          x = kMax - (24 * screenScaleY),
		  y = 5 + Floor( 14 * screenScaleY ) * 5,
          w = kMax,
		  h = 14 * screenScaleY,
  		bordersize = 2,
	    label = "MainMenuOn",
		offLabel = "MainMenuOff",
        font = XenonautsLabelFontSmallBlack,
        fontScale = screenScaleY * topOptionFont,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
	    outline = 2,
	  command =
		function()
			ToggleStatsIncrements();
		end,
	},



    NonUniformScaledImage
    {
      x = 0,
      y = 5 + Floor( 14 * screenScaleY ) * 6 + 2,
      w = kMax,
      h = 1,

  	  image = "uitextures/black",
  	  tint  = Black50A,
    },

    TiledImage
    {
      x = 5,
      y = 5 + Floor( 14 * screenScaleY ) * 6 + 4,
      w = kMax,
      h = kMax - 1*( 5 + Floor( 18 * screenScaleY ) ) - Floor( 6 * screenScaleY ),
      --image = "uitextures/transparent",
      bordersize = 4,

      ListControl
      {
        name = "hotkeylist",
        x = 2,
        y = 2,
        w = kMax - 1,
        h = kMax - 2,
        font = MediumSoldierBlack,
        hcolor = WhiteColor,

        TiledImage
        {
          name = "scrollbar",
          x = kMax - 8,
          y = 0,
          w = kMax - 1,
          h = kMax,
          image = "uitextures/scrollbar_black",
          bordersize = 4,

          NonUniformScaledImage
          {
            name  = "scrollbarBtn",
            x = 1,
            y = 0,
            w = 6,
            h = 5,
            image = "uitextures/black",
          },
        },
      },
    },

    NonUniformScaledImage
    {
      x = 0,
	  y = kMax - 1*( 5 + Floor( 18 * screenScaleY ) ) - Floor( 5 * screenScaleY ),
      w = kMax,
      h = 1,

  	  image = "uitextures/black",
  	  tint  = Black50A,
    },

    ScalingText
    {
      font = XenonautsLabelFontSmallBlack,
      x = 5,
	  y = kMax - 1*( 5 + Floor( 18 * screenScaleY ) ),
      w = kMax,
      h = Floor( 18 * screenScaleY ),
      fontScale = screenScaleY * topOptionFont,
      label = "OptionsDialog.CustomSoldierList",
  	  flags  = kVAlignCenter,
    },
	  TiledImage
	  {
	    x      = 150 * mmScaleX,
	    y      = kMax - 1*( 5 + Floor( 16 * screenScaleY ) ),
	    w      = kMax,
	    h      = Floor( 14 * screenScaleY ),
      image  = "ui_screens/mainmenu/forcesoldierbg",
      bordersize = 4,

		  ClearingTextEdit
		  {
		    x      = 2,
		    y      = 0,
		    w      = kMax - 2,
		    h      = kMax,
			  font   = XenonautsLabelFontSmallBlack,
			  name   = "customsoldiers",
			  flags  = kVAlignCenter,
			  utf8   = true,
			  length = 100,
			  ignore = kIllegalCustChars,
  		  clearonfocus = false;
			  updateeverykey = true;
			  emptytext = "";
			  fontScale = screenScaleY * 0.9,
		  },
		},



	},
}
