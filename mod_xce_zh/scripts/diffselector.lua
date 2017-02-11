require "scripts/style"

NormalColor = Color(0,0,0,255);
OverColor   = MainMenuWhiteColor;
DownColor   =  MainMenuWhiteColor;

local diffButtonFont = 1.4; -- Originally 1.3
local startButtonFont = 1.4;  -- Originally 1.1
local descFont     = 1; -- Originally 1
local optionFont     = 1; -- Originally 0.65

MakeDialog
{
	DiffSelector
	{
	  w = kMax,
	  h = kMax,

	  fit = true,

		TiledImage
		{
			name  = "backgroundimage",
  		w     = kMax,
  		h     = kMax,
		  --image = "uitextures/commonbg",
  		bordersize = 2,

      NonUniformScaledImage
      {
        x = 0,
        y = 0,
        w = kMax,
        h = 1,

  	    image = "uitextures/black",
  	    tint  = BarGrey,
      },

  		NonUniformScaledImage
  		{
  		  name = "DiffImage",
  		  x    = kCenter,
  		  y    = 20 * screenScaleY,
  		  w    = 320 * screenScaleY,
  		  h    = 320 * screenScaleY,

  		  image = "diffimages/normal",
  		},

      BeginGroup(),
      SetStyle( XenonautsInvisibleRadioButtonStyle ),
      TiledButton
      {
        name = "easy",
        x = kCenter - 240 * screenScaleY,
        y = 360 * screenScaleY,
        w = 100 * screenScaleY,
        h = 35 * screenScaleY,
    		bordersize = 2,
        font = MainMenuButton,
        fontScale = screenScaleY * diffButtonFont,
   overfontcolor = OverColor,
   downfontcolor = DownColor,
        outlineselected = true,
        outlinehovered  = true,
	   outline = 2,
        label = "DiffSelect.easydiff",

        command =
          function()
            DiffChanged( 0 );
          end,
      },
      TiledButton
      {
        name = "normal",
        x = kCenter - 90 * screenScaleY,
        y = 360 * screenScaleY,
        w = 100 * screenScaleY,
        h = 35 * screenScaleY,
    		bordersize = 2,
        font = MainMenuButton,
        fontScale = screenScaleY * diffButtonFont,
   overfontcolor = OverColor,
   downfontcolor = DownColor,
        outlineselected = true,
        outlinehovered  = true,
	   outline = 2,
        label = "DiffSelect.normdiff",

        command =
          function()
            DiffChanged( 1 );
          end,
      },
      TiledButton
      {
        name = "veteran",
        x = kCenter + 80 * screenScaleY,
        y = 360 * screenScaleY,
        w = 100 * screenScaleY,
        h = 35 * screenScaleY,
    		bordersize = 2,
        font = MainMenuButton,
        fontScale = screenScaleY * diffButtonFont,
   overfontcolor = OverColor,
   downfontcolor = DownColor,
        outlineselected = true,
        outlinehovered  = true,
	   outline = 2,
        label = "DiffSelect.vetdiff",

        command =
          function()
            DiffChanged( 2 );
          end,
      },
      TiledButton
      {
        name = "superhuman",
        x = kCenter + 230 * screenScaleY,
        y = 360 * screenScaleY,
        w = 100 * screenScaleY,
        h = 35 * screenScaleY,
    		bordersize = 2,
        font = MainMenuButton,
        fontScale = screenScaleY * diffButtonFont,
   overfontcolor = OverColor,
   downfontcolor = DownColor,
        outlineselected = true,
        outlinehovered  = true,
	   outline = 2,
        label = "DiffSelect.shdiff",

        command =
          function()
            DiffChanged( 3 );
          end,
      },

      ScalingText
      {
        name = "DiffDesc",
        font = MainMenuButtonWhite,
        x = 5,
        y = 420 * screenScaleY,
        w = kMax - 5,
        h = 100 * screenScaleY,
        fontScale = screenScaleY * descFont,
  	    flags = kHAlignCenter + kVAlignTop,
        label = "DiffSelect.easydiffdesc",
		outline = 2,
      },

      Window
      {
        x = 5 * screenScaleY,
        y = 500 * screenScaleY,
        w = 250 * screenScaleY,
        h = 30 * screenScaleY,

	  	ScalingText
		  {
			  font = MainMenuButton,
			  name = "tooltiptext",
				x = 10 * screenScaleY,
				y = 5.5 * screenScaleY,
				w = 100 * screenScaleY,
			  h = 30  * screenScaleY,
			  label = "DiffSelect.ExplanatoryTooltips",
			  fontScale = optionFont * screenScaleY,
		  },

      SetStyle( XenonautsInvisibleTiledToggleButtonStyle ),
      TiledButton
        {
          name = "tooltipenable",
         x = 100 * screenScaleY,
         y = 0 * screenScaleY,
         w = 80 * screenScaleY,
		 h = 30  * screenScaleY,
         flags = kHAlignLeft + kVAlignCenter,
  		bordersize = 2,
	    label = "MainMenuOn",
		offLabel = "MainMenuOff",
        font = MainMenuButton,
        fontScale = screenScaleY * optionFont,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
        outlinehovered  = true,
	    outline = 2,
        command =
          function()
            TooltipEnableChanged();
          end,
        },
      },

      TooltipRect
      {
        x = 5 * screenScaleY,
        y = 525 * screenScaleY,
        w = 250 * screenScaleY,
        h = 30 * screenScaleY,

        text = "DiffSelect.ironmandesc",

	  	ScalingText
		  {
			  font = MainMenuButton,
			  name = "ironmantext",
				x = 10 * screenScaleY,
				y = 5.5 * screenScaleY,
				w = 100 * screenScaleY,
			  h = 30  * screenScaleY,
			  label = "DiffSelect.ironman",
			  fontScale = optionFont * screenScaleY,
		  },

      SetStyle( XenonautsInvisibleTiledToggleButtonStyle ),
      TiledButton
        {
          name = "ironman",
         x = 100 * screenScaleY,
         y = 0 * screenScaleY,
         w = 80 * screenScaleY,
		 h = 30  * screenScaleY,
         flags = kHAlignLeft + kVAlignCenter,
  		bordersize = 2,
	    label = "MainMenuOn",
		offLabel = "MainMenuOff",
        font = MainMenuButton,
        fontScale = screenScaleY * optionFont,
        overfontcolor = OverColor,
        downfontcolor = DownColor,
        outlineselected = true,
        outlinehovered  = true,
	    outline = 2,

  		    NonUniformScaledImage
  		    {
  		      name = "ironmanlock",
  		      x    = 0,
  		      y    = 0,
  		      w    = 0,
  		      h    = 0,
  		    },
        },
      },

      Window
      {
        x = kMax - 320 * screenScaleY,
        y = 507 * screenScaleY,
        w = kMax,
        h = 45 * screenScaleY,

      SetStyle( XenonautsTiledButtonStyleMenu ),
      TiledButton
        {
          name = "start",
          default = true,
          x = 143 * screenScaleY,
          y = kCenter,
          w = kMax,
		          h = 35 * screenScaleY,
    		bordersize = 2,
        label = "DiffSelect.Begin",
		font = MainMenuButton,
        fontScale = screenScaleY * startButtonFont,
		overfontcolor = MainMenuWhiteColor,
        downfontcolor = DownColor,
		NormalColor = BlackColor,
		outlineselected = true,
        outlinehovered  = true,
	    outline = 2,

          command =
            function()
              PopModal( "mainmenu" );
              OnStartGame();
            end,
        },

      },
		},
	},
}