require "scripts/style"

BaseStatFont = {
  GeoscapeFont,
  1,
  BlackColor
};

RotateButtonGraphics = {
	"ui_screens/ui_aircraft/buttonup",
	"ui_screens/ui_aircraft/buttondown",
	"ui_screens/ui_aircraft/buttonover",
	"ui_screens/ui_aircraft/buttondownover",
};

RotateButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kPush,
	graphics = RotateButtonGraphics,
};

local scl = ( hwh / 940 );

local bll = BGGetScaledX( 534 );
local blt = BGGetScaledY( 62  );
local blw = BGGetScaledY( 852 ); --has to be a square, scaled on screen height
local blh = BGGetScaledY( 852 );

local bil  = BGGetScaledX( 146 );
local bit  = BGGetScaledY( 66  );
local biw  = BGGetScaledX( 345 + 146 ) - BGGetScaledX( 146 );
local bih  = BGGetScaledY( 410 +  66 ) - BGGetScaledY( 66  );
local bieh = bih / 20;

local bml = BGGetScaledX( 146 );
local bmt = BGGetScaledY( 546 );
local bmw = BGGetScaledX( 345 + 146 ) - BGGetScaledX( 146 );
local bmh = BGGetScaledY( 366 + 546 ) - BGGetScaledY( 546 );

local bsl = BGGetScaledX( 1430 );
local bst = BGGetScaledY( 430  );
local bsw = BGGetScaledX( 343 + 1430 ) - BGGetScaledX( 1430 );
local bsh = BGGetScaledY( 225 +  430 ) - BGGetScaledY(  430 );

local bpl = BGGetScaledX( 1430 );
local bpt = BGGetScaledY( 66    );
local bpw = BGGetScaledX( 343 + 1430 ) - BGGetScaledX( 1430 );
local bph = BGGetScaledY( 314 +   66 ) - BGGetScaledY(   66 );

local smalllabel = 1; -- originally 1.0
local defaultText = screenResolutionH * 0.018; -- originally 0.014
local titleText = screenResolutionH * 0.024; -- originally 0.018

local baseInfoRightWidth = biw * 0.25; -- originally 0.2
local baseInfoDotsRight  = biw * 0.75; -- originally 0.8

local baseMaintenanceRightWidth = bmw * 0.25; -- originally 0.2
local baseMaintenanceDotsRight  = bmw * 0.65; -- originally 0.8

local prevInfoRightWidth = bpw * 0.35; -- originally 0.3
local prevInfoDotsLeft   = bpw * 0.25;
local prevInfoDotsRight  = bpw * 0.50; -- originally 0.55

local listSpacing = 1.5;

MakeDialog
{
  BaseView
  {
    name = "baseview",

    x = 0,
    y = 0,
    w = kMax,
    h = kMax,

    Window
    {
	    name = "buildinglayout",
      x = bll,
      y = blt,
      w = blw,
      h = blh,
    },    

    Window
    {
	    name = "panel1",
      x = bil + 2,
      y = bit - 5,
      w = biw - 5,
      h = bih,

      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = 0,
        w = kMax,
        h = bieh,
        label = "BaseView.PersonnelCapUsed",
        fontScale = defaultText,
        flags = kHAlignLeft + kVAlignBottom,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "percap",
        x = 0,
        y = Floor( bieh * 1 ),
        w = kMax,
        h = bieh,
        left = "Empty",
        hidedots = true,
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "percapp",
        x = 0,
        y = Floor( bieh * 1 ) + 2,
        w = biw * 0.75,
        h = bieh,
        barheight = bieh * 0.65,
        min = 0,
        max = 100,
        barcolor = Color(0,201,29,255);
        bgimage  = "ui_screens/ui_research/progress_bg",
        barimage = "ui_screens/ui_research/progressbar",
        bgtilebordersize = 4,
        percent  = false,
      },

      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = Floor( bieh * 2.1 ),
        w = kMax,
        h = bieh,
        label = "BaseView.ResearchCapUsed",
        fontScale = defaultText,
        flags = kHAlignLeft + kVAlignBottom,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "rescap",
        x = 0,
        y = Floor( bieh * 3.1 ),
        w = kMax,
        h = bieh,
        left = "Empty",
        hidedots = true,
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "rescapp",
        x = 0,
        y = Floor( bieh * 3.1 ) + 1,
        w = biw * 0.75,
        h = bieh,
        barheight = bieh * 0.65,
        min = 0,
        max = 100,
        barcolor = Color(0,201,29,255);
        bgimage  = "ui_screens/ui_research/progress_bg",
        barimage = "ui_screens/ui_research/progressbar",
        bgtilebordersize = 4,
        percent  = false,
      },
      
      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = Floor( bieh * 4.2 ),
        w = kMax,
        h = bieh,
        label = "BaseView.WorkshopCapUsed",
        fontScale = defaultText,
        flags = kHAlignLeft + kVAlignBottom,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "worcap",
        x = 0,
        y = Floor( bieh * 5.2 ),
        w = kMax,
        h = bieh,
        left = "Empty",
        hidedots = true,
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "worcapp",
        x = 0,
        y = Floor( bieh * 5.2 ) + 1,
        w = biw * 0.75,
        h = bieh,
        barheight = bieh * 0.65,
        min = 0,
        max = 100,
        barcolor = Color(0,201,29,255);
        bgimage  = "ui_screens/ui_research/progress_bg",
        barimage = "ui_screens/ui_research/progressbar",
        bgtilebordersize = 4,
        percent  = false,
      },

      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = Floor( bieh * 6.3 ),
        w = kMax,
        h = bieh,
        label = "BaseView.HangarCapUsed",
        fontScale = defaultText,
        flags = kHAlignLeft + kVAlignBottom,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "hancap",
        x = 0,
        y = Floor( bieh * 7.3 ),
        w = kMax,
        h = bieh,
        left = "Empty",
        hidedots = true,
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "hancapp",
        x = 0,
        y = Floor( bieh * 7.3 ) + 1,
        w = biw * 0.75,
        h = bieh,
        barheight = bieh * 0.65,
        min = 0,
        max = 100,
        barcolor = Color(0,201,29,255);
        bgimage  = "ui_screens/ui_research/progress_bg",
        barimage = "ui_screens/ui_research/progressbar",
        bgtilebordersize = 4,
        percent  = false,
      },

      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = Floor( bieh * 8.4 ),
        w = kMax,
        h = bieh,
        label = "BaseView.GarageCapUsed",
        fontScale = defaultText,
        flags = kHAlignLeft + kVAlignBottom,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "garcap",
        x = 0,
        y = Floor( bieh * 9.4 ),
        w = kMax,
        h = bieh,
        left = "Empty",
        hidedots = true,
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "garcapp",
        x = 0,
        y = Floor( bieh * 9.4 ) + 1,
        w = biw * 0.75,
        h = bieh,
        barheight = bieh * 0.65,
        min = 0,
        max = 100,
        barcolor = Color(0,201,29,255);
        bgimage  = "ui_screens/ui_research/progress_bg",
        barimage = "ui_screens/ui_research/progressbar",
        bgtilebordersize = 4,
        percent  = false,
      },

      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = Floor( bieh * 10.5 ),
        w = kMax,
        h = bieh,
        label = "BaseView.HospitalCapUsed",
        fontScale = defaultText,
        flags = kHAlignLeft + kVAlignBottom,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "hoscap",
        x = 0,
        y = Floor( bieh * 11.5 ),
        w = kMax,
        h = bieh,
        left = "Empty",
        hidedots = true,
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      ProgressBar
      {
        font = XenonautsDisabledFont,
        name = "hoscapp",
        x = 0,
        y = Floor( bieh * 11.5 )  + 1,
        w = biw * 0.75,
        h = bieh,
        barheight = bieh * 0.65,
        min = 0,
        max = 100,
        barcolor = Color(0,201,29,255);
        bgimage  = "ui_screens/ui_research/progress_bg",
        barimage = "ui_screens/ui_research/progressbar",
        bgtilebordersize = 4,
        percent  = false,
      },
      
      DottedLabel
      {
        font = BaseStatFont,
        name = "solnum",
        x = 0,
        y = Floor( bieh * 13.2 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Soldiers",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "scinum",
        x = 0,
        y = Floor( bieh * 14.2 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Scientists",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "engnum",
        x = 0,
        y = Floor( bieh * 15.2 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Engineers",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },

      DottedLabel
      {
        font = BaseStatFont,
        name = "radcha",
        x = 0,
        y = Floor( bieh * 17 ),
        w = kMax,
        h = bieh,
        left = "BaseView.DetectRange",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "defstr",
        x = 0,
        y = Floor( bieh * 18.8 ),
        w = kMax,
        h = bieh,
        left = "BaseView.DefenseStrength",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseInfoRightWidth,
        righta = kHAlignCenter,
        dotsr  = baseInfoDotsRight,
      },
    },   
    
    Window
    {
	    name = "panel2",
      x = bml + 10,
      y = bmt + 12,
      w = bmw - 20,
      h = bmh,

      ScalingText
      {
        font = BaseStatFont,
        x = 0,
        y = 0,
        w = kMax,
        h = bieh * 1.25,
        label = "BaseView.MonthlyMaintenance",
        fontScale = titleText,
        flags = kHAlignCenter + kVAlignCenter,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "struc",
        x = 0,
        y = Floor( bieh * 2.2 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Wages.Structures",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "wages",
        x = 0,
        y = Floor( bieh * 4.2 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Wages.Personnel",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "wagessol",
        x = 0,
        y = Floor( bieh * 5 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Soldiers",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "wagessci",
        x = 0,
        y = Floor( bieh * 5.8 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Scientists",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "wageseng",
        x = 0,
        y = Floor( bieh * 6.6 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Engineers",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },

      DottedLabel
      {
        font = BaseStatFont,
        name = "vehic",
        x = 0,
        y = Floor( bieh * 8.6 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Wages.Vehicles",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "vehichun",
        x = 0,
        y = Floor( bieh * 9.4 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Hunter",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "vehicsci",
        x = 0,
        y = Floor( bieh * 10.2 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Scimitar",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },

      DottedLabel
      {
        font = BaseStatFont,
        name = "vehichyp",
        x = 0,
        y = Floor( bieh * 11.0 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Hyperion",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "aircraft",
        x = 0,
        y = Floor( bieh * 12.7 ),
        w = kMax,
        h = bieh,
        left = "BaseView.Wages.Aircrafts",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "interceptors",
        x = 0,
        y = Floor( bieh * 13.5 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Interceptors",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "dropships",
        x = 0,
        y = Floor( bieh * 14.3 ),
        w = kMax,
        h = bieh * smalllabel,
        left = "BaseView.Wages.Dropships",
        right = "undefined",
        fontScale = defaultText,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "totalmaintenance",
        x = 0,
        y = Floor( bieh * 16.1 ),
        w = kMax,
        h = bieh,
        left = "BaseView.MonthlyCost",
        right = "undefined",
        fontScale = defaultText * 1.1,
        rightw = baseMaintenanceRightWidth,
        righta = kHAlignLeft,
        dotsr  = baseMaintenanceDotsRight,
      },
    },   

    Window
    {
	    name = "panel4",
      x = bpl + (bpw * 0.05),
      y = bpt + (bpt * 0.16),
      w = bpw * 0.9,
      h = bph,

      NonUniformScaledImage
      {
        x = 0,
        y = 0,
        w = kMax,
        h = (bpw / 2) * 0.9,
	      image = "uitextures/transparent",
	      
        NonUniformScaledImage
        {
	        name  = "buildingpreviews",
          x = kCenter,
          y = 0,
          w = bpw / 2,
          h = kMax,
	        image = "uitextures/grass",
        },
        NonUniformScaledImage
        {
	        name  = "buildingpreviewr",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
	        image = "uitextures/grass",
        },
      },
      
      ScalingText
      {
        name = "previewname",
        font = BaseStatFont,
        x = 0,
        y = bpw *0.50,
        w = kMax,
        h = bieh,
        label = "undefined",
        fontScale = titleText,
      },
      SetStyle( RotateButtonStyle ),
      TiledButton
      {
        name = "rotatebtn",
        x = bpw * 0.7,
        y = bpw *0.50,
        w = kMax * 1,
        h = bieh,
        bordersize = 4,
        font = BaseStatFont,
        label = "BaseView.Rotate",
        fontScale = defaultText,
        command = 
          function()
            RotateBuilding();
          end,
      },

      DottedLabel
      {
        font = BaseStatFont,
        name = "previewcost",
        x = 0,
        y = 2 * bpw / 3.3,
        w = kMax,
        h = bieh,
        left = "BV.COST",
        right = "undefined",
        fontScale = defaultText,
        rightw = prevInfoRightWidth,
        righta = kHAlignLeft,
        dotsl  = prevInfoDotsLeft,
        dotsr  = prevInfoDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "previewmaintenance",
        x = 0,
        y = 2 * bpw / 3.3 + Floor( bieh * 1.1 ),
        w = kMax,
        h = bieh,
        left = "BV.MAINTENANCE",
        right = "undefined",
        fontScale = defaultText,
        rightw = prevInfoRightWidth,
        righta = kHAlignLeft,
        dotsl  = prevInfoDotsLeft,
        dotsr  = prevInfoDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "previewbuildtime",
        x = 0,
        y = 2 * bpw / 3.3 + Floor( bieh * 2.2 ),
        w = kMax,
        h = bieh,
        left = "BV.BUILDTIME",
        right = "undefined",
        fontScale = defaultText,
        rightw = prevInfoRightWidth,
        righta = kHAlignLeft,
        dotsl  = prevInfoDotsLeft,
        dotsr  = prevInfoDotsRight,
      },
      DottedLabel
      {
        font = BaseStatFont,
        name = "previewvar",
        x = 0,
        y = 2 * bpw / 3.3 + Floor( bieh * 3.3 ),
        w = kMax,
        h = bieh,
        left = "undefined",
        right = "undefined",
        fontScale = defaultText,
        rightw = prevInfoRightWidth,
        righta = kHAlignLeft,
        dotsl  = prevInfoDotsLeft,
        dotsr  = prevInfoDotsRight,
      },
    },

    Window
    {
	    name = "panel5",
      x = bsl,
      y = bst * 1.01,
      w = bsw,
      h = bsh,

      ListControl
      {
        name = "buildinglist",
        x = 0,
        y = 0,
        w = kMax,
        h = kMax,
        font = BaseStatFont,
		    fontScale = defaultText,
		    thcolor = WhiteColor,
		    mcolor = WhiteColor,
		    textsize = defaultText * listSpacing,
        onoffmode = true,
        hswl = true,
      
        TiledImage
        {
          name = "scrollbar",
          x = kMax - 9,
          y = 0,
          w = kMax,
          h = kMax,
          image = "uitextures/scrollbar",
          tint = Color(192,192,192,255),
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
}
