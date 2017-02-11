require "scripts/style"

NormalColor = Color(0,0,0,255);
OverColor   = Color(255,255,255,155);
DownColor   = Color(255,255,255,255);

MakeDialog
{
	name = "mainmenu",
	TitleMenu
	{
  	name = "mainmenuimpl",
	  x = kCenter,
	  y = kCenter,
	  w = kMax,
	  h = kMax,
	  
	  image = "backgrounds/mainmenu/background",
	  loadNow = true;

	  NonUniformScaledImage
	  {
	    name = "clipboard",
	  
      x = kCenter,
      y = kMax - 165 * screenScaleY,
      w = 1250 * screenScaleY,
      h = 1250 / ( 1680 / 1006 ) * screenScaleY,

	    image = "backgrounds/mainmenu/clipboard",
	    loadNow = true;

      BeginGroup(),
      SetStyle( XenonautsInvisibleTiledRadioButtonStyle ),
      TiledButton
      {
        name = "newgame",
        x = kCenter - 210 * screenScaleY,
        y = 98  * screenScaleY,
        w = 200 * screenScaleY,
        h = 56  * screenScaleY,
  		  bordersize = 2,
        label = "NewGame",
        font = MainMenuButton,
        fontScale = screenScaleY * 1.6,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
		outlinehovered  = true,
	      outline = 2,
        
        command = 
          function()
            OnNewGame();
          end,
      },
	  
      TiledButton
      {
        name = "loadgame",
        x = kCenter,
        y = 98  * screenScaleY,
        w = 200 * screenScaleY,
        h = 56  * screenScaleY,
  		  bordersize = 2,
        label = "LoadGame.MainMenu",
        font = MainMenuButton,
        fontScale = screenScaleY * 1.6,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
		outlinehovered  = true,
        outline = 2,
        
        command = 
          function()
            OnLoadGame();
          end,
      },
	  
      TiledButton
      {
        name = "options",
        x = kCenter + 215 * screenScaleY,
        y = 98  * screenScaleY,
        w = 200 * screenScaleY,
        h = 56  * screenScaleY,
  		  bordersize = 2,
        label = "Options.MainMenu",
        font = MainMenuButton,
        fontScale = screenScaleY * 1.6,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
		outlinehovered  = true,
	      outline = 2,
        
        command = 
          function()
            OnOptions();
          end,
      },

	    ScalingText
		  {
			  font = XenonautsLabelFontMediumBlack,
			  name = "newgamesubtitle",
			  x = kCenter - 155 * screenScaleY,
			  y = 138  * screenScaleY,
			  w = 200 * screenScaleY,
			  h = 56  * screenScaleY,
			  label = "NewGameSubtitle",
			  fontScale = 1.2 * screenScaleY,
		  },
	  
      ScalingText
		  {
			  font = XenonautsLabelFontMediumBlack,
			  name = "loadgamesubtitle",
			  x = kCenter + 42,
			  y = 138  * screenScaleY,
			  w = 150 * screenScaleY,
			  h = 56  * screenScaleY,
			  label = "LoadGameSubtitle",
			  fontScale = 1.2 * screenScaleY,
		  },
	  
	  	ScalingText
		  {
			  font = XenonautsLabelFontMediumBlack,
			  name = "optionssubtitle",
			  x = kCenter + 249 * screenScaleY,
			  y = 138  * screenScaleY,
			  w = 150 * screenScaleY,
			  h = 56  * screenScaleY,
			  label = "OptionsSubtitle",
			  fontScale = 1.2 * screenScaleY,
		  },
	  
      SetStyle( XenonautsTiledButtonStyleMenu ),
      TiledButton
      {
        name = "exit",
        x = 340 * screenScaleY,
        y = 45  * screenScaleY,
        w = 155 * screenScaleY,
        h = 34  * screenScaleY,
  		  bordersize = 2,
        label = "Exit",
        font = MainMenuButton,
        fontScale = screenScaleY * 1.3,
		overfontcolor = OverColor,
        downfontcolor = DownColor,
		outlineselected = true,
		outlinehovered  = true,
	    outline = 2,
        
        command = 
          function()
            MainMenuExitGame();
          end,
      },
      
	    Window
	    {
	      name = "dialoghost",
  	  
        x = 318 *  screenScaleY,
        y = 170 *  screenScaleY,
        w = kMax - 330 *  screenScaleY,
        h = kMax - 10 *  screenScaleY,

	      image = "uitextures/black",
	      loadNow = true;
	    },      
  	},
	},
}