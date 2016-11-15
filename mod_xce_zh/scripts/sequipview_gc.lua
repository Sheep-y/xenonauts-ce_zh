require "scripts/style"

local soldierScale = 0.29 * screenScaleY;
local soldierSizeX = 420 * soldierScale;
local soldierSizeY = 560 * soldierScale;

local slotLabelHeight = 1.25; -- originally 1.0

CloseButtonGraphics = {
	"gui/buttonframeup_red",
	"gui/buttonframedown_red",
	"gui/buttonframeover_red",
};

CloseButtonStyle = {
	parent   = XenonautsTiledButtonStyle,
	graphics = CloseButtonGraphics,
};

MakeDialog
{
  SoldierEquipView
  {
    name = "sequipview",

    x = 0,
    y = 0,
    w = kMax,
    h = kMax,

	Bitmap
    {
      name = "armourbackpiece",
      x = 240 * 0.5 * screenScaleX,             -- - soldierSizeX * 0.5,
      y = ( 155 * 0.5 - 80 ) * screenScaleY,    -- - soldierSizeY * 0.5,
      scale = soldierScale,
      image = "armourimages/basicarmour",
    },
    Bitmap
    {
      name = "soldierface",
      x = 240 * 0.5 * screenScaleX,             -- - soldierSizeX * 0.5,
      y = ( 155 * 0.5 - 80 ) * screenScaleY,    -- - soldierSizeY * 0.5,
      scale = soldierScale,
      image = "armourimages/face1",
    },
    Bitmap
    {
      name = "soldierhands",
      x = 240 * 0.5 * screenScaleX,             -- - soldierSizeX * 0.5,
      y = ( 155 * 0.5 - 80 ) * screenScaleY,    -- - soldierSizeY * 0.5,
      scale = soldierScale,
      image = "armourimages/basicarmour",
    },
    Bitmap
    {
      name = "soldierarmour",
      x = 240 * 0.5 * screenScaleX,             -- - soldierSizeX * 0.5,
      y = ( 155 * 0.5 - 80 ) * screenScaleY,    -- - soldierSizeY * 0.5,
      scale = soldierScale,
      image = "armourimages/basicarmour",
    },



	ScalingText
	{
	  font = XenonautsButtonFontLarge,
	  name = "soldiernamex",
	  x = 10,
	  y = 7,
	  w = kMax - 7,
	  h = 20 * screenScaleY,
	  flags = kHAlignLeft + kVAlignCenter,
	  label = "undefined",
      fontScale = screenScaleY,
	},    
	    
    Container
    {
      name = "gcstats",
      x = 10,
      y = 20 * screenScaleY + 7,
	  w = 140 * screenScaleX,
	  h = 10 * screenScaleY + ( 14 * screenScaleY ) * 6,
	  
      DottedLabelsContainer
	  {
		name = "dottedLabelsCtr",
		x = 0,
		y = 0,
		w = kMax,
		h = kMax,

		justifyDots  = true,
		
		DottedLabel
		{
			font = XenonautsLabelFontMediumOrange,
			name = "statapx",
			x = 0,
			y = 10 * screenScaleY + ( 14 * screenScaleY ) * 0,
			w = kMax - 5,
			h = 14 * screenScaleY,
			left = "SEQ.STATAP",
			right = "undefined",
			leftcolor = OrangeTextColor,
			dotscolor = WhiteColor,
			rightcolor = OrangeTextColor,
			fontScale = screenScaleY,
		},
		DottedLabel
		{
			font = XenonautsLabelFontMediumOrange,
			name = "statresx",
			x = 0,
			y = 10 * screenScaleY + ( 14 * screenScaleY ) * 1,
			w = kMax - 5,
			h = 14 * screenScaleY,
			left = "SEQ.STATRESILENCE",
			right = "undefined",
			leftcolor = OrangeTextColor,
			dotscolor = WhiteColor,
			rightcolor = OrangeTextColor,
			fontScale = screenScaleY,
		},
		DottedLabel
		{
			font = XenonautsLabelFontMediumOrange,
			name = "statstrx",
			x = 0,
			y = 10 * screenScaleY + ( 14 * screenScaleY ) * 2,
			w = kMax - 5,
			h = 14 * screenScaleY,
			left = "SEQ.STATSTRENGTH",
			right = "undefined",
			leftcolor = OrangeTextColor,
			dotscolor = WhiteColor,
			rightcolor = OrangeTextColor,
			fontScale = screenScaleY,
		},
		DottedLabel
		{
			font = XenonautsLabelFontMediumOrange,
			name = "stataccx",
			x = 0,
			y = 10 * screenScaleY + ( 14 * screenScaleY ) * 3,
			w = kMax - 5,
			h = 14 * screenScaleY,
			left = "SEQ.STATACCURACY",
			right = "undefined",
			leftcolor = OrangeTextColor,
			dotscolor = WhiteColor,
			rightcolor = OrangeTextColor,
			fontScale = screenScaleY,
		},
		DottedLabel
		{
			font = XenonautsLabelFontMediumOrange,
			name = "statrefx",
			x = 0,
			y = 10 * screenScaleY + ( 14 * screenScaleY ) * 4,
			w = kMax - 5,
			h = 14 * screenScaleY,
			left = "SEQ.STATREFLEXES",
			right = "undefined",
			leftcolor = OrangeTextColor,
			dotscolor = WhiteColor,
			rightcolor = OrangeTextColor,
			fontScale = screenScaleY,
		},
		DottedLabel
		{
			font = XenonautsLabelFontMediumOrange,
			name = "statbravx",
			x = 0,
			y = 10 * screenScaleY + ( 14 * screenScaleY ) * 5,
			w = kMax - 5,
			h = 14 * screenScaleY,
			left = "SEQ.STATBRAVERY",
			right = "undefined",
			leftcolor = OrangeTextColor,
			dotscolor = WhiteColor,
			rightcolor = OrangeTextColor,
			fontScale = screenScaleY,
		},
	  },

    },


    InventoryContainer
    {
      name  = "ground",
      x = 0,
      y = kMax - Floor( 23 * screenScaleX ) * 6 - Floor( screenScaleY * 23 ) - 5,
      w = kMax,
      h = kMax,
      headimage = "uitextures/sequip/frametoptrans",
      bodyimage = "uitextures/sequip/framebottomtrans2",
      bordersize = 2,
      headersize = 26 * screenScaleY,
      location = 0,
      
      ScalingText
      {
        font = MedSmallSoldier,
        name = "static",
        x = 5,
        y = 17 * screenScaleY,
        w = kMax,
        h = 10 * screenScaleY,
        fontScale = screenScaleY,
  	    flags = kHAlignLeft + kVAlignBottom,
        label = "SEQ.GROUND",
      },
    },

    TitledFrame
    {
      name  = "primweaponframe",
      x = 30 * screenScaleX,
      y = 10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 5 * Floor( 23 * screenScaleX ),
      h = 23 * screenScaleY + ( 5 * Floor( 23 * screenScaleX ) * 2 / 5 ),
      headimage = "uitextures/sequip/frametoptrans",
      bodyimage = "uitextures/sequip/framebottomtrans",
      bordersize = 2,
      headersize = 23 * screenScaleY,
      
      ScalingText
      {
        font = MedSmallSoldier,
        name = "static",
        x = 0,
        y = 3 * screenScaleY,
        w = kMax,
        h = 20 * screenScaleY,
        fontScale = screenScaleY * slotLabelHeight,
  	    flags = kHAlignLeft + kVAlignBottom,
        label = "SEQ.PRIMWEAPON",
      },
      WeaponSlot
      {
        name = "primary",
        x = 0,
        y = 23 * screenScaleY,
        w = kMax,
        h = kMax,
        image = "weapons/empty",
      },
    },

    TitledFrame
    {
      name  = "secondaryweaponframe",
      x = 30 * screenScaleX,
      y = 23 * screenScaleY + ( 5 * Floor( 23 * screenScaleX ) * 2 / 5 ) + 5 +
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 5 * Floor( 23 * screenScaleX ),
      h = 23 * screenScaleY + ( 5 * Floor( 23 * screenScaleX ) * 2 / 5 ),
      headimage = "uitextures/sequip/frametoptrans",
      bodyimage = "uitextures/sequip/framebottomtrans",
      bordersize = 2,
      headersize = 23 * screenScaleY,
      
      ScalingText
      {
        font = MedSmallSoldier,
        name = "static",
        x = 0,
        y = 3 * screenScaleY,
        w = kMax,
        h = 20 * screenScaleY,
        fontScale = screenScaleY * slotLabelHeight,
  	    flags = kHAlignLeft + kVAlignBottom,
        label = "SEQ.SECWEAPON",
      },
      WeaponSlot
      {
        name = "secondary",
        x = 0,
        y = 23 * screenScaleY,
        w = kMax,
        h = kMax,
        image = "weapons/empty",
      },
    },


    ScalingText
    {
      font = MedSmallSoldier,
      name = "hideme1",
      x = 30 * screenScaleX,
      y = ( 23 * screenScaleY + ( 115 * 2 / 5 ) * screenScaleX ) * 2 + 5 + 10 +
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 160 * screenScaleX,
      h = 17 * screenScaleY,
      flags = kHAlignLeft + kVAlignBottom,
      label = "SEQ.CARRWEIGHT",
      fontScale = screenScaleY * slotLabelHeight,
    },
    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "carriedweight",
      x = 30 * screenScaleX,
      y = ( 23 * screenScaleY + ( 115 * 2 / 5 ) * screenScaleX ) * 2 + 5 + 15 + 12 * screenScaleY +
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 90 * screenScaleX,
      h = 8 * screenScaleY,
      barheight = 8 * screenScaleY,
      min = 0,
      max = 100,
      barcolor = Color(0,201,29,255),
      barcolor2 = BarGrey,
      barcolor3 = RedColor,
      bgimage  = "uitextures/blackframetrans",
      barimage = "uitextures/white",
      bgtilebordersize = 4,
      percent  = false,
    },
    ScalingText
    {
      font = XenonautsLabelFontSmallStatbar,
      name = "carriedweightText",
      x = 30 * screenScaleX + 74 * screenScaleX,
      y = ( 23 * screenScaleY + ( 115 * 2 / 5 ) * screenScaleX ) * 2 + 5 + 10 + 12 * screenScaleY +
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 40 * screenScaleX,
      h = 17 * screenScaleY,
	    flags = kHAlignRight + kVAlignCenter,
      label = "undefined",
      fontScale = screenScaleY * slotLabelHeight,
    },

    ScalingText
    {
      font = MedSmallSoldier,
      name = "hideme2",
      x = 30 * screenScaleX,
      y = ( 23 * screenScaleY + ( 115 * 2 / 5 ) * screenScaleX ) * 2 + 5 + 10 + 12 * screenScaleY + 12 * screenScaleY + 5 + 
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 160 * screenScaleX,
      h = 17 * screenScaleY,
	    flags = kHAlignLeft + kVAlignBottom,
      label = "SEQ.APAFTERPENALTY",
      fontScale = screenScaleY * slotLabelHeight,
    },
    ProgressBar
    {
      font = XenonautsDisabledFont,
      name = "apafterpen",
      x = 30 * screenScaleX,
      y = ( 23 * screenScaleY + ( 115 * 2 / 5 ) * screenScaleX ) * 2 + 5 + 15 + 12 * screenScaleY + 12 * screenScaleY + 5 + 12 * screenScaleY +
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 90 * screenScaleX,
      h = 8 * screenScaleY,
      barheight = 8 * screenScaleY,
      min = 0,
      max = 100,
      barcolor = Color(0,201,29,255),
      bgimage  = "uitextures/blackframetrans",
      barimage = "uitextures/white",
      bgtilebordersize = 4,
      percent  = false,
    },
    ScalingText
    {
      font = XenonautsLabelFontSmallStatbar,
      name = "apafterpenText",
      x = 30 * screenScaleX + 74 * screenScaleX,
      y = ( 23 * screenScaleY + ( 115 * 2 / 5 ) * screenScaleX ) * 2 + 5 + 10 + 12 * screenScaleY + 12 * screenScaleY + 5 + 12 * screenScaleY +
          10 * screenScaleY + ( 14 * screenScaleY ) * 6 + 20 * screenScaleY + 7,
      w = 40 * screenScaleX,
      h = 17 * screenScaleY,
	    flags = kHAlignRight + kVAlignCenter,
      label = "undefined",
      fontScale = screenScaleY * slotLabelHeight,
    },
	ScalingText
    {
      font = MedSmallSoldierOrange,
      name = "itemmovecost",
      x = 30 * screenScaleX,
      y = kMax - Floor( 23 * screenScaleX ) * 6 - Floor( screenScaleY * 23 ) - 5,
      w = kMax - 20 * screenScaleX,
      h = 23 * screenScaleY,
	    flags = kHAlignRight + kVAlignBottom,
      label = "SEQ.ITEMMOVECOST",
      fontScale = screenScaleY,
    },




    InventoryContainer
    {
	    name  = "backpack",
      x = kMax - (10 + 5 * Floor( 23 * screenScaleX )) - 23 * screenScaleX,
      y = 80 * screenScaleY,
      w = 10 + 5 * Floor( 23 * screenScaleX ),
      h = 10 + 5 * Floor( 23 * screenScaleX ) + 22 * screenScaleY,
	    headimage = "uitextures/sequip/frametoptrans",
	    bodyimage = "uitextures/sequip/framebottomtrans2",
      bordersize = 2,
      headersize = 26 * screenScaleY,
      location = 1,
      
      ScalingText
      {
        font = MedSmallSoldier,
        name = "static",
        x = 5,
        y = 7 * screenScaleY,
        w = kMax,
        h = 20 * screenScaleY,
        fontScale = screenScaleY * slotLabelHeight,
  	    flags = kHAlignLeft + kVAlignBottom,
        label = "SEQ.BACKPACK",
      },
      
      -- Line 1
      InventorySlot
      {
	      name  = "slot1_1",
        x = 5  + 0 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertopleft",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_2",
        x = 5  + 1 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertop",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertop",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertop",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertopright",
        bordersize = 3,
      },

      -- Line 2
      InventorySlot
      {
	      name  = "slot2_1",
        x = 5  + 0 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerleft",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot2_2",
        x = 5  + 1 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot2_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot2_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot2_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerright",
        bordersize = 3,
      },

      -- Line 3
      InventorySlot
      {
	      name  = "slot3_1",
        x = 5  + 0 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 2 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerleft",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot3_2",
        x = 5  + 1 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 2 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot3_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 2 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot3_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 2 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot3_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 2 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerright",
        bordersize = 3,
      },

      -- Line 4
      InventorySlot
      {
	      name  = "slot4_1",
        x = 5  + 0 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 3 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerleft",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot4_2",
        x = 5  + 1 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 3 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot4_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 3 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot4_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 3 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/center",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot4_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 3 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerright",
        bordersize = 3,
      },

      -- Line 5
      InventorySlot
      {
	      name  = "slot5_1",
        x = 5  + 0 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 4 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottomleft",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot5_2",
        x = 5  + 1 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 4 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottom",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot5_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 4 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottom",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot5_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 4 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottom",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot5_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 4 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottomright",
        bordersize = 3,
      },
    },
    
    InventoryContainer
    {
	    name  = "belt",
      x = kMax - (10 + 5 * Floor( 23 * screenScaleX )) - 23 * screenScaleX,
      y = 80  * screenScaleY + 10 + 5 * Floor( 23 * screenScaleX ) + 22 * screenScaleY,
      w = 10 + 5 * Floor( 23 * screenScaleX ),
      h = 10 + 5 * Floor( 23 * screenScaleX ) + 22 * screenScaleY,
	    image = "uitextures/titledframe",
	    headimage = "uitextures/sequip/frametoptrans",
	    bodyimage = "uitextures/sequip/framebottomtrans2",
      bordersize = 2,
      headersize = 27 * screenScaleY,
      location = 2;
      
      ScalingText
      {
        font = MedSmallSoldier,
        name = "static",
        x = 5,
        y = 7 * screenScaleY,
        w = kMax,
        h = 20 * screenScaleY,
        fontScale = screenScaleY * slotLabelHeight,
  	    flags = kHAlignLeft + kVAlignBottom,
        label = "SEQ.BELT",
      },

      -- Line 1
      InventorySlot
      {
	      name  = "slot1_1",
        x = 5  + 0 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerend",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_2",
        x = 5  + 1 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertopbottom",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertop",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertop",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot1_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 0 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centertopright",
        bordersize = 3,
      },

      -- Line 2
      InventorySlot
      {
	      name  = "slot2_3",
        x = 5  + 2 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottomleft",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot2_4",
        x = 5  + 3 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottom",
        bordersize = 3,
      },
      InventorySlot
      {
	      name  = "slot2_5",
        x = 5  + 4 * Floor( 23 * screenScaleX ),
        y = 23 * screenScaleY + 5 + 1 * Floor( 23 * screenScaleX ),
        w = Floor( 23 * screenScaleX ),
        h = Floor( 23 * screenScaleX ),
	      image = "uitextures/sequip/centerbottomright",
        bordersize = 3,
      },
    },
    
      SetStyle( XenonautsRoleButtonStyle ),
      NonUniformScaledButton
      {
        name  = "soldierrolebutton",
      x = kMax - (4 + 5 * Floor( 23 * screenScaleX )) - 23 * screenScaleX,
      y = 37 * screenScaleY,
      w = 40 * screenScaleY,
      h = 40 * screenScaleY,
      command = 
        function()
          RoleClicked();
        end,
    },
    
    SetStyle( CloseButtonStyle ),
    TiledButton
    {
        name = "backtobattle",
        default = true,
        cancel = true,
	    align = kHAlignRight + kVAlignTop,
        x = kMax,
        y = 0,
        w = 25 * screenScaleX,
        h = 34 * screenScaleY,
        bordersize = 2,
        font = XenonautsButtonFontLarge,  --MediumSoldier,
        label = "SEQ.BACKTOBATTLE",
        fontScale = screenScaleY,
  	      
        command = 
          function()
            OnBackToBattle();
          end,
    },
  }
}