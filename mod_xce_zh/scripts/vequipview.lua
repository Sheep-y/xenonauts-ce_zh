require "scripts/style"

VEQSelectorFont = {
  GeoscapeFont,
  1,
  BlackColor
};

VEQWeaponFont = {
  GeoscapeFont,
  1,
  WhiteColor
};

VEQWeaponFontBlack = {
  GeoscapeFont,
  1,
  BlackColor
};

VEQStatFont = {
  GeoscapeFont,
  1,
  VEQstatColor
};

VEQStatLinkFont = {
  GeoscapeFont,
  1,
  BlueLinkColor
};

ScrollLeftButtonGraphics = {
	"uitextures/scrollleft",
	"uitextures/scrollleft_down",
	"uitextures/scrollleft_over",
};

ScrollRightButtonGraphics = {
	"uitextures/scrollright",
	"uitextures/scrollright_down",
	"uitextures/scrollright_over",
};

ScrollLeftButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kPush,
  graphics = ScrollLeftButtonGraphics,
	font     = XenonautsButtonFontLarge,
};

ScrollRightButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kPush,
  graphics = ScrollRightButtonGraphics,
	font     = XenonautsButtonFontLarge,
};

local soldierScale = 0.4 * screenScaleY;
local soldierSizeX = 849 * soldierScale;
local soldierSizeY = 1250 * soldierScale;
local maskTint = Color( 255, 255, 255, 255 );
local listTint = Color( 255, 255, 255, 255 );

local scl = ( hwh / 940 );
local selH = scl * 210;

local vsl = 947 / 802;
local vss = selH * 0.65;
local vsw = (vss * vsl) * 1.15;
local vsh = vss;
local vst = selH * 0.08;

function calclistbgwidth ()
  return vsw * numVehicleSlots + Floor( selH * 0.05 ) * ( numVehicleSlots - 1 ) + Floor( selH * 0.15 ) * 2;
end

local selV = calclistbgwidth();

local wsaspect = 600 / 236;
local wsh = scl * 175;
local wsw = wsh * wsaspect;

local stw = scl * 388;
local sth = scl * 542;

local pbarcolor = Color(0,201,29,255);

local vehicleAspect = 1146 / 860;
local vehicleSize   = 0.92;
local vehicleHeight = hwh * vehicleSize;
local vehicleWidth  = hwh * vehicleSize * vehicleAspect;

local linkHeight = 0.04;  -- originally 0.035
local specHeight = 0.045; -- originally 0.03
local statHeight = 0.055; -- originally 0.04
local navigationText = 0.06; -- originally 0.045
local progressBarLeft  = stw * 0.23; -- originally stw * 0.325
local progressBarWidth = stw * 0.15; -- originally stw * 0.100

VEQSelectorEditFont = {
  GeoscapeFont,
  stw * 0.07,
  BlackColor
};

MakeDialog
{
  VehicleEquipView
  {
    name = "vequipview",

    x = 10,
    y = 30,
    w = kMax,
    h = kMax,

    NonUniformScaledImage
    {
      name  = "bigimage",
      x = hww * 0.46,
      y = hwh * 0.47,
      w = vehicleWidth,
      h = vehicleHeight,
      align = kHAlignCenter + kVAlignCenter,
      image = "uitextures/transparent",
      tint = maskTint;

      ScalingText
      {
        font = VEQWeaponFont,
        name = "percentComplete",
        x = kCenter,
        y = kCenter,
        w = kMax,
        h = hwh / 7.5,
        fontScale = hwh / 15,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "Empty",
      },
      ScalingText
      {
        font = VEQWeaponFont,
        name = "noVehicles",
        x = kCenter,
        y = hwh * 0.3,
        w = kMax,
        h = hwh / 15,
        fontScale = hwh / 15,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "VEQ.NoVehicles",
      },
    },

    TiledImage
    {
      name = "statpanel",
      x = 0,
      y = 20,
      w = stw,
      h = sth,
      image = "ui_screens/ui_stores/speechbubble",
      bordersize = 4,

      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehiclename",
        x = stw * 0.04,
        y = stw * 0.025,
        w = kMax,
        h = stw * 0.07,
  	    flags = kHAlignLeft + kVAlignCenter,
        label = "undefined",
			  fontScale = stw * 0.07,
      },
      ClearingTextEdit
      {
        font = VEQSelectorEditFont,
        name = "callsignedit",
        x = stw * 0.04,
        y = stw * 0.025,
        w = kMax,
        h = stw * 0.07,
  	    flags = kHAlignLeft + kVAlignCenter,
			  utf8   = true,
			  length = 20,
			  ignore = kIllegalNameChars,
      },
      SetStyle( XenonautsInvisibleTiledButtonStyle ),
      TiledButton
      {
			  name   = "vehiclecallsign",
        x = stw * 0.04,
        y = stw * 0.100,
        w = kMax,
        h = stw * linkHeight,
  	    flags  = kHAlignLeft + kVAlignCenter,
			  fontScale = stw * linkHeight,
		    bordersize = 1,
			  font   = VEQStatLinkFont,
			  label  = "VEQ.Rename",
			  underlined = true,

        command =
          function()
            OnChangeVehicleCallsign();
          end,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "statlength",
        x = stw * 0.04,
        y = stw * 0.200,
        w = kMax - stw * 0.04,
        h = stw * specHeight,
        left = "VEQ.LENGTH",
        right = "undefined",
        fontScale = stw * specHeight,
      },
      DottedLabel
      {
        font = VEQStatFont,
        name = "statwidth",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 1,
        w = kMax - stw * 0.04,
        h = stw * specHeight,
        left = "VEQ.WIDTH",
        right = "undefined",
        fontScale = stw * specHeight,
      },
      DottedLabel
      {
        font = VEQStatFont,
        name = "statweight",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 2,
        w = kMax - stw * 0.04,
        h = stw * specHeight,
        left = "VEQ.WEIGHT",
        right = "undefined",
        fontScale = stw * specHeight,
      },
      DottedLabel
      {
        font = VEQStatFont,
        name = "statpower",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 3,
        w = kMax - stw * 0.04,
        h = stw * specHeight,
        left = "VEQ.POWER",
        right = "undefined",
        fontScale = stw * specHeight,
      },
      DottedLabel
      {
        font = VEQStatFont,
        name = "statspeed",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 4,
        w = kMax - stw * 0.04,
        h = stw * specHeight,
        left = "VEQ.SPEED",
        right = "undefined",
        fontScale = stw * specHeight,
      },

      ---------------------------

      DottedLabel
      {
        font = VEQStatFont,
        name = "statmissions",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 8,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.MISSIONS",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
      },
      DottedLabel
      {
        font = VEQStatFont,
        name = "statkills",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 9,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.KILLS",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "stataps",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 0,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.TimeUnits",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "statapsp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 0 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "stathps",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 1,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.HPS",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "stathpsp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 1 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "statfarmour",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 2,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.FRONTARMOUR",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "statfarmourp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 2 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "statsarmour",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 3,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.SIDEARMOUR",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "statsarmourp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 3 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "statrarmour",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 4,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.REARARMOUR",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "statrarmourp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 4 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "stataccuracy",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 5,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.ACCURACY",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "stataccuracyp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 5 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      DottedLabel
      {
        font = VEQStatFont,
        name = "statreflexes",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 6,
        w = kMax - stw * 0.04,
        h = stw * statHeight,
        left = "VEQ.REFLEXES",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = WhiteColor,
        rightcolor = BlackColor,
        fontScale = stw * statHeight,
        hidedots = true,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "statreflexesp",
        x = progressBarLeft,
        y = stw * 0.206 + Floor( stw * 0.042) * 9 + Floor( stw * 0.06 ) * 6 + stw * 0.005,
        w = kMax - progressBarWidth,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
      },

      ----------------------------

      ScalingText
      {
        font = VEQSelectorFont,
        name = "assigntext",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.044 * 6.2 ),
        w = kMax,
        h = stw * statHeight,
        flags = kHAlignLeft + kVAlignCenter,
        label = "VEQ.Assignment",
        fontScale = stw * statHeight,
      },

      ComboBox
      {
        name = "assigncombo",
        x = stw * 0.5,
        y = stw * 0.200 + Floor( stw * 0.044 * 6 ),
        w = kMax - stw * 0.04,
        h = stw * ( statHeight + 0.01 ),

        TiledImage
        {
          name = "listcontrolbg",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
          image = "uitextures/white",
          tint = Color(22,22,22,255),

          ScalingText
          {
            font = VEQWeaponFont,
            name = "textlabel",
            x = 0,
            y = 0,
            w = kMax,
            h = kMax,
	          flags = kHAlignCenter + kVAlignCenter,
            label = "undefined",
            fontScale = -0.8,
          },
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
          name = "combobutton",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
          bordersize = 2,
          font = VEQWeaponFont,

          command =
            function()
            end,
        },
        TiledImage
        {
          name = "listcontrolbg",
          x = 0,
          y = stw * 0.05,
          w = kMax,
          h = wsh * 0.6,
          image = "uitextures/soldiereqbutton",
          bordersize = 4,

          ListControl
          {
            name = "listcontrol",
            x = 0,
            y = 0,
            w = kMax,
            h = kMax,
            font = VEQWeaponFont,
            fontScale = stw * statHeight,
            hswl = true,

            TiledImage
            {
              name = "scrollbar",
              x = kMax - 9,
              y = 0,
              w = kMax,
              h = kMax,
              image = "uitextures/scrollbar",
              bordersize = 4,

              NonUniformScaledImage
              {
	              name  = "scrollbarBtn",
                x = 2,
                y = 2,
                w = 5,
                h = 5,
	              image = "uitextures/white",
              },
            },
          },
        },
      },

      SetStyle( XenonautsInvisibleTiledButtonStyle ),
      TiledButton
      {
          name = "soldierdismissbutton",
          x = stw * 0.04,
          y = kMax - stw * 0.155,
          w = stw * 0.4,
          h = stw * linkHeight,
  	      flags  = kHAlignLeft + kVAlignCenter,
			    fontScale = stw * linkHeight,
		      bordersize = 1,
			    font   = VEQStatLinkFont,
          label = "VEQ.STATDISMISS",
  			  underlined = true,

          command =
            function()
              OnDecommissionVehiclePressed();
            end,
      },
      TiledButton
      {
          name = "relocatebutton",
          x = kMax - stw * 0.44,
          y = kMax - stw * 0.155,
          w = stw * 0.4,
          h = stw * linkHeight,
  	      flags  = kHAlignRight + kVAlignCenter,
			    fontScale = stw * linkHeight,
		      bordersize = 1,
			    font   = VEQStatLinkFont,
          label = "VEQ.RELOCATE",
  			  underlined = true,

          command =
            function()
              DoModal( "scripts/relocatedialog.lua" );
            end,
      },

      NonUniformScaledImage
      {
          x = 1,
          y = kMax - stw * 0.11,
          w = kMax - 1,
          h = 1,
          image = "uitextures/black",
          tint = Color( 0, 0, 0, 25 );
      },

      NonUniformScaledImage
      {
          x = stw / 2,
          y = kMax - stw * 0.11 + 1,
          w = 1,
          h = kMax - 1,
          image = "uitextures/black",
          tint = Color( 0, 0, 0, 25 );
      },

      SetStyle( XenonautsInvisibleTiledButtonStyle ),
      TiledButton
      {
        name = "prevsoldierbutton",
        x = 0,
        y = kMax - stw * 0.11 + 1,
        w = stw * 0.5,
        h = kMax,
        bordersize = 2,
        font = VEQSelectorFont,
        label = "VEQ.Previous",
        fontScale = stw * navigationText,

        command =
          function()
            OnPrevVehiclePressed();
          end,
      },
      TiledButton
      {
        name = "nextsoldierbutton",
        x = stw * 0.5,
        y = kMax - stw * 0.11 + 1,
        w = kMax,
        h = kMax,
        bordersize = 2,
        font = VEQSelectorFont,
        label = "VEQ.Next",
        fontScale = stw * navigationText,

        command =
          function()
            OnNextVehiclePressed();
          end,
      },
    },

    TiledImage
    {
      name = "vehiclelistholder",
      x = 0,
      y = kMax - selH - 5,
      w = selV,
      h = selH,
      image = "ui_screens/ui_stores/speechbubble",
      bordersize = 4,

      SetStyle( ScrollLeftButtonStyle ),
      TiledButton
      {
        name = "scrollleft",
        x = 0,
        y = kCenter,
        w = 22 * screenScaleY,
        h = 22 * screenScaleY,
        bordersize = 2,
        label = "",
        fontScale = screenScaleY,

        command =
          function()
            ScrollList( true );
          end,
      },
      SetStyle( ScrollRightButtonStyle ),
      TiledButton
      {
        name = "scrollright",
        x = kMax,
        y = kCenter,
        w = 22 * screenScaleY,
        h = 22 * screenScaleY,
        align = kHAlignRight + kVAlignTop,
        bordersize = 2,
        label = "",
        fontScale = screenScaleY,

        command =
          function()
            ScrollList( false );
          end,
      },

      TiledImage
      {
        name  = "vehicleslot1",
        x = selH * 0.15,
        y = selH * 0.1,
        w = vsw,
        h = vsh,
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "image",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "ui_screens/ui_vehicles/vehiclebackground",
          tint = maskTint;
        },
        NonUniformScaledImage
        {
          name  = "vehicle",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "uitextures/transparent",
          tint = listTint;
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
			    name   = "button",
		      x      = 1,
		      y      = 1,
          w      = kMax - 1,
		      h      = kMax - 1,
			    font   = XenonautsEditFontMiniBlue,

          command =
            function()
              OnVehicleButtonPressed( 0 );
            end,
        },
      },
      TiledImage
      {
        name  = "vehicleslot2",
        x = selH * 0.15 + Floor( vsw * 1 ) + Floor( selH * 0.05 * 1 ),
        y = selH * 0.1,
        w = vsw,
        h = vsh,
	      image = "uitextures/weaponframe2",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "image",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "ui_screens/ui_vehicles/vehiclebackground",
          tint = maskTint;
        },
        NonUniformScaledImage
        {
          name  = "vehicle",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "uitextures/transparent",
          tint = listTint;
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
			    name   = "button",
		      x      = 0,
		      y      = 0,
          w      = kMax,
		      h      = kMax,
			    font   = XenonautsEditFontMiniBlue,

          command =
            function()
              OnVehicleButtonPressed( 1 );
            end,
        },
      },
      TiledImage
      {
        name  = "vehicleslot3",
        x = selH * 0.15 + Floor( vsw * 2 ) + Floor( selH * 0.05 * 2 ),
        y = selH * 0.1,
        w = vsw,
        h = vsh,
	      image = "uitextures/weaponframe2",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "image",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "ui_screens/ui_vehicles/vehiclebackground",
          tint = maskTint;
        },
        NonUniformScaledImage
        {
          name  = "vehicle",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "uitextures/transparent",
          tint = listTint;
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
			    name   = "button",
		      x      = 0,
		      y      = 0,
          w      = kMax,
		      h      = kMax,
			    font   = XenonautsEditFontMiniBlue,

          command =
            function()
              OnVehicleButtonPressed( 2 );
            end,
        },
      },
      TiledImage
      {
        name  = "vehicleslot4",
        x = selH * 0.15 + Floor( vsw * 3 ) + Floor( selH * 0.05 * 3 ),
        y = selH * 0.1,
        w = vsw,
        h = vsh,
	      image = "uitextures/weaponframe2",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "image",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "ui_screens/ui_vehicles/vehiclebackground",
          tint = maskTint;
        },
        NonUniformScaledImage
        {
          name  = "vehicle",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "uitextures/transparent",
          tint = listTint;
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
			    name   = "button",
		      x      = 0,
		      y      = 0,
          w      = kMax,
		      h      = kMax,
			    font   = XenonautsEditFontMiniBlue,

          command =
            function()
              OnVehicleButtonPressed( 3 );
            end,
        },
      },
      TiledImage
      {
        name  = "vehicleslot5",
        x = selH * 0.15 + Floor( vsw * 4 ) + Floor( selH * 0.05 * 4 ),
        y = selH * 0.1,
        w = vsw,
        h = vsh,
	      image = "uitextures/weaponframe2",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "image",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "ui_screens/ui_vehicles/vehiclebackground",
          tint = maskTint;
        },
        NonUniformScaledImage
        {
          name  = "vehicle",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "uitextures/transparent",
          tint = listTint;
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
			    name   = "button",
		      x      = 0,
		      y      = 0,
          w      = kMax,
		      h      = kMax,
			    font   = XenonautsEditFontMiniBlue,

          command =
            function()
              OnVehicleButtonPressed( 4 );
            end,
        },
      },
      TiledImage
      {
        name  = "vehicleslot6",
        x = selH * 0.15 + Floor( vsw * 5 ) + Floor( selH * 0.05 * 5 ),
        y = selH * 0.1,
        w = vsw,
        h = vsh,
	      image = "uitextures/weaponframe2",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "image",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "ui_screens/ui_vehicles/vehiclebackground",
          tint = maskTint;
        },
        NonUniformScaledImage
        {
          name  = "vehicle",
          x = 1,
          y = 1,
          w = kMax - 1,
          h = kMax - 1,
          image = "uitextures/transparent",
          tint = listTint;
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
			    name   = "button",
		      x      = 0,
		      y      = 0,
          w      = kMax,
		      h      = kMax,
			    font   = XenonautsEditFontMiniBlue,

          command =
            function()
              OnVehicleButtonPressed( 5 );
            end,
        },
      },
      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehicleslotname1",
        x = selH * 0.15,
        y = selH * 0.17 + vsh,
        w = vsw,
        h = vst * 1.35,
        fontScale = vst * 1.1,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "undefined",
      },
      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehicleslotname2",
        x = selH * 0.15 + Floor( vsw * 1 ) + Floor( selH * 0.05 * 1 ),
        y = selH * 0.17 + vsh,
        w = vsw,
        h = vst * 1.35,
        fontScale = vst * 1.1,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "undefined",
      },
      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehicleslotname3",
        x = selH * 0.15 + Floor( vsw * 2 ) + Floor( selH * 0.05 * 2 ),
        y = selH * 0.17 + vsh,
        w = vsw,
        h = vst * 1.35,
        fontScale = vst * 1.1,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "undefined",
      },
      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehicleslotname4",
        x = selH * 0.15 + Floor( vsw * 3 ) + Floor( selH * 0.05 * 3 ),
        y = selH * 0.17 + vsh,
        w = vsw,
        h = vst * 1.35,
        fontScale = vst * 1.1,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "undefined",
      },
      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehicleslotname5",
        x = selH * 0.15 + Floor( vsw * 4 ) + Floor( selH * 0.05 * 4 ),
        y = selH * 0.17 + vsh,
        w = vsw,
        h = vst * 1.35,
        fontScale = vst * 1.1,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "undefined",
      },
      ScalingText
      {
        font = VEQSelectorFont,
        name = "vehicleslotname6",
        x = selH * 0.15 + Floor( vsw * 5 ) + Floor( selH * 0.05 * 5 ),
        y = selH * 0.17 + vsh,
        w = vsw,
        h = vst * 1.35,
        fontScale = vst * 1.1,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "undefined",
      },
    },

    TiledImage
    {
      name = "weaponpanel",
      x = kMax - wsw - 8,
      y = kCenter - (hww * 0.05),
      w = wsw,
      h = wsh * 1.4,
      image = "ui_screens/ui_stores/speechbubble",
      bordersize = 4,

      NonUniformScaledImage
      {
	      name  = "static",
        x = wsw * 0.03,
        y = wsw * 0.03,
        w = wsw * 0.94,
        h = wsh * 0.94,
	      image = "uitextures/white",
        bordersize = 2,
        tint = Color(174,174,176,255),

        NonUniformScaledImage
        {
          name  = "weaponImage",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
          image = "uitextures/transparent",
        },
      },
      ComboBox
      {
        name = "weaponselector",
        x = wsw * 0.03,
        y = wsw * 0.05 + wsh * 0.94,
        w = wsw * 0.94,
        h = kMax - wsw * 0.03,

        NonUniformScaledImage
        {
          name = "listcontrolbg",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
          image = "uitextures/white",
          tint = Color(22,22,22,255),

          ScalingText
          {
            font = VEQWeaponFont,
            name = "textlabel",
            x = 0,
            y = 0,
            w = kMax,
            h = kMax,
	          flags = kHAlignCenter + kVAlignCenter,
            label = "undefined",
            fontScale = -0.5,
          },
        },
        SetStyle( XenonautsInvisibleTiledButtonStyle ),
        TiledButton
        {
          name = "combobutton",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
          bordersize = 2,
          font = VEQWeaponFont,

          command =
            function()
            end,
        },
        TiledImage
        {
          name = "listcontrolbg",
          x = 0,
          y = kCenter + (hww * 0.057),
          w = kMax,
          h = wsh,
          image = "ui_screens/ui_stores/speechbubble",
          bordersize = 4,

          ListControl
          {
            name = "listcontrol",
            x = 0,
            y = 0,
            w = kMax,
            h = kMax,
            font = VEQWeaponFontBlack,
            fontScale = wsh * 0.12,
            hswl = true,

            TiledImage
            {
              name = "scrollbar",
              x = kMax - 9,
              y = 0,
              w = kMax,
              h = kMax,
              image = "uitextures/scrollbar",
              bordersize = 4,

              NonUniformScaledImage
              {
	              name  = "scrollbarBtn",
                x = 2,
                y = 2,
                w = 5,
                h = 5,
	              image = "uitextures/white",
              },
            },
          },
        },
      },
    },
  }
}

SetWindowVisible( "callsignedit", false );
