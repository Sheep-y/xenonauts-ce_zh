require "scripts/style"

OverColor   = Color(255,255,255,155);
DownColor   = Color(255,255,255,255);


MakeDialog
{
	name = "options",
	OptionsWindow
	
	{
	  x = kCenter,
	  y = kCenter,
	  w = 350 * screenScaleX,
	  h = 500 * screenScaleY,
	  movable = true,
	
	  image = "uitextures/commonbg",
    bordersize = 2,
    
    ScalingText
    {
      font = XenonautsLabelFontMedium,
      x = 5,
      y = 0,
      w = kMax,
      h = 62 * screenScaleY,
      flags = kHAlignCenter + kVAlignCenter,
      fontScale = screenScaleY * 1.2,
      label = "Options",
    },
    
    ScalingText
    {
      font = XenonautsLabelFontSmall,
      x = 8,
      y = Floor( 16 * screenScaleY ) + 62 * screenScaleY,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY,
      label = "OptionsDialog.MouseSens",
    },
    ScalingText
    {
      font = XenonautsLabelFontSmall,
      x = 8,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) + 62 * screenScaleY,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY,
      label = "OptionsDialog.KbdScrollSens",
    },
    ScalingText
    {
      font = XenonautsLabelFontSmall,
      x = 8,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 2 + 62 * screenScaleY,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY,
      label = "OptionsDialog.MusicVolume",
    },
    ScalingText
    {
      font = XenonautsLabelFontSmall,
      x = 8,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 3 + 62 * screenScaleY,
      w = kMax,
      h = kMax,
      fontScale = screenScaleY,
      label = "OptionsDialog.SfxVolume",
    },
    
    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "mousesens",
      x = 150 * screenScaleX,
      y = Floor( 16 * screenScaleY ) + 62 * screenScaleY,
      w = kMax - 5,
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
      x = 150 * screenScaleX,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) + 62 * screenScaleY,
      w = kMax - 5,
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
      x = 150 * screenScaleX,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 2 + 62 * screenScaleY,
      w = kMax - 5,
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
      x = 150 * screenScaleX,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 3 + 62 * screenScaleY,
      w = kMax - 5,
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
		font = XenonautsLabelFontSmall,
		x = 8,
		y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 4 + 62 * screenScaleY,
		w = kMax,
		h = 12 * screenScaleY,
		fontScale = screenScaleY,
		label = "OptionsDialog.TuReserveMode",
		flags  = kVAlignCenter,
		name = "label",
	},
      SetStyle( XenonautsInvisibleTiledToggleButtonStyle ),
      TiledButton
	{
	  name = "TuReserveToggle",
	  x = kMax - (24 * screenScaleY),
	  y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 4 + 62 * screenScaleY,
	  w = kMax,
	  h = 12 * screenScaleY,
	    bordersize = 2,
		label = "MainMenuOn",
		offLabel = "MainMenuOff",
		font = XenonautsLabelFontSmall,
		fontScale = screenScaleY * 1,
	  command =
		function()
			ToggleTuReserve();
		end,
	},
	
	ScalingText
	{
		font = XenonautsLabelFontSmall,
		x = 8,
		y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 5 + 62 * screenScaleY,
		w = kMax,
		h = 12 * screenScaleY,
		fontScale = screenScaleY,
		label = "OptionsDialog.ShowStatsIncrements",
		flags  = kVAlignCenter,
		name = "label",
	},
      SetStyle( XenonautsInvisibleTiledToggleButtonStyle ),
      TiledButton
	{
	  name = "StatsIncrementsToggle",
	  x = kMax - (24 * screenScaleY),
	  y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 5 + 62 * screenScaleY,
	  w = kMax,
	  h = 12 * screenScaleY,
	    bordersize = 2,
		label = "MainMenuOn",
		offLabel = "MainMenuOff",
		font = XenonautsLabelFontSmall,
		fontScale = screenScaleY * 1,
	  command =
		function()
			ToggleStatsIncrements();
		end,
	},
    
    TiledImage
    {
      x = 5,
      y = Floor( 16 * screenScaleY ) + Floor( 14 * screenScaleY ) * 6 + 66 * screenScaleY,
      w = kMax - 5,
      h = kMax - 1 *( 18 * screenScaleY + 5 ) - 3 * screenScaleY,
         image = "ui_screens/xenopedia/scrollbar_dark",
      bordersize = 4,

      ListControl
      {
        name = "hotkeylist",
        x = 2,
        y = 2,
        w = kMax - 2,
        h = kMax - 2,
        font = MediumSoldier,
      
        TiledImage
        {
          name = "scrollbar",
          x = kMax - 8,
          y = 0,
          w = kMax,
          h = kMax,
         image = "ui_screens/xenopedia/scrollbar",
          bordersize = 4,

          NonUniformScaledImage
          {
            name  = "scrollbarBtn",
            x = 2,
            y = 2,
            w = 4,
            h = 5,
	     image = "ui_screens/xenopedia/white",
          },
        },
      },
    },


        
	  
    SetStyle( XenonautsTiledButton2Style ),
    TiledButton
    {
      name = "OK",
      default = true,
      cancel = true,
      x = kCenter,
      y = kMax - 16 * screenScaleY - 5,
      w = 90 * screenScaleX,
      h = 16 * screenScaleY,
		  bordersize = 2,
      label = "OK",
      font = XenonautsLabelFontMedium,
      fontScale = screenScaleY,
      
      command = 
        function()
          PopModal( "options" );
        end,
    },
	},
}
