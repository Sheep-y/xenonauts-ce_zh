require "scripts/style"

local headerHeight = hwh * 0.04;
local headerFontSize = screenResolutionH * 0.02; -- originally 0.014
local columnSpacing = 11;
local sellTableHeight = hwh * 0.86;
local sellTableWidth  = hww - 4 * columnSpacing;
local stc1 = sellTableWidth * 2.1 / 7;
local stc2 = sellTableWidth * 1.0 / 7;
local stc3 = sellTableWidth * 1.0 / 7;
local stc4 = sellTableWidth * 1.4 / 7;
local stc5 = sellTableWidth * 1.5 / 7;
local xferTableHeight = sellTableHeight - hwh * 0.067;
local ttc1 = sellTableWidth * 2.1 / 7;
local ttc2 = sellTableWidth * 1 / 7;
local ttc3 = sellTableWidth * 1.4 / 7;
local ttc4 = sellTableWidth * 1 / 7;
local ttc5 = sellTableWidth * 1.5 / 7;
local buttonFontSize = headerFontSize * 1.25;

HeaderFont = {
  GeoscapeFont,
  headerFontSize,
  BlackColor
};

ButtonFont = {
  GeoscapeFont,
  buttonFontSize,
  BlackColor
};

ComboButtonGraphics = {
	"uitextures/combobuttonframeup",
	"uitextures/combobuttonframedown",
	"uitextures/combobuttonframeover",
	"uitextures/combobuttonframedownover",
};

ComboButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kToggle,
	graphics = ComboButtonGraphics,
	font     = XenonautsButtonFontLarge,
};

GrayColor = Color(155,152,145,255);

ButtonGraphics = {
	"ui_screens/ui_stores/stores_lightbutton",
	"ui_screens/ui_stores/stores_darkbutton",
	"ui_screens/ui_stores/stores_overbutton",
};

ButtonStyle = {
	parent   = DefaultStyle,
	font     = ButtonFont,
	sound    = kDefaultButtonSound,
	type     = kPush,
	graphics = ButtonGraphics,
};

MakeDialog
{
  StoreView
  {
    name = "storeview",

    x = 0,
    y = 0,
    w = kMax,
    h = kMax,
    
    Window
    {
	    name  = "saleview",
      x = 0,
      y = 0,
      w = hww,
      h = kMax,
      
      TitledFrame
      {
	      name  = "static",
        x = 0,
        y = 0,
        w = stc1,
        h = sellTableHeight,
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "col0header",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.ITEMNAME",
		  command = 
			function()
				SortItems(0);
			end,
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = stc1 + columnSpacing * 1,
        y = 0,
        w = stc2,
        h = sellTableHeight,
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "col1header",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.VALUE",
		  command = 
			function()
				SortItems(1);
			end,
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = stc1 + stc2 + columnSpacing * 2,
        y = 0,
        w = stc3,
        h = sellTableHeight,
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "col2header",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.QUANTITY",
		  command = 
			function()
				SortItems(2);
			end,
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = stc1 + stc2 + stc3 + columnSpacing * 3,
        y = 0,
        w = stc4,
        h = sellTableHeight,
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.SELL",
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = stc1 + stc2 + stc3 + stc4 + columnSpacing * 4,
        y = 0,
        w = stc5 - 10,
        h = sellTableHeight,
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.VOS",
        },
      },

      ListControl
      {
	      name  = "sourceitems",
        x = 0,
        y = headerHeight + 5,
        w = hww,
        h = sellTableHeight - headerHeight - 5,
        font = HeaderFont,
        fontScale = 1,
        drawSelection = false,
        hswl = true,
        
        column1x = 0 + hwh * 0.02,
        column1w = stc1 - 10,
        column2x = stc1 + columnSpacing * 1 + 5,
        column2w = stc2 - 10,
        column3x = stc1 + stc2 + columnSpacing * 2 + 5,
        column3w = stc3 - 10,
        column4x = stc1 + stc2 + stc3 + columnSpacing * 3 + 5,
        column4w = stc4 - 10,
        column5x = stc1 + stc2 + stc3 + stc4 + columnSpacing * 4 + 5,
        column5w = stc5 - 10 - 10,

        TiledImage
        {
          name = "scrollbar",
          x = hww - 9,
          y = 0,
          w = 9,
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
      
      TiledImage
      {
        name = "static",
        x = hwh * 0.025,
        y = sellTableHeight + (hwh * 0.035),
        w = (stc1 + stc2 + stc3 + stc4) + (3 * columnSpacing) - (2 * (hwh * 0.025)),
        h = kMax,
        image = "ui_screens/ui_stores/stores_frame",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "static",
          x = kCenter + (hwh * 0.02),
          y = kCenter,
          w = hww * 0.8 * 0.20,
          h = 1,
          image = "uitextures/white",
          tint = GrayColor,
        },

        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 5 + (hwh * 0.025),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignLeft + kVAlignCenter,
          label = "StoreView.TotalSale",
          fontScale = 1,
        },
        ScalingText
        {
          font = HeaderFont,
          name = "tvslabel",
          x = 5 - (hwh * 0.06),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignRight + kVAlignCenter,
          label = "#$132.123.123",
          fontScale = 1,
        },
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = hww * 0.8 * 0.625 + 5 + (hww * 0.01),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignLeft + kVAlignCenter,
          label = "StoreView.Funds",
          fontScale = 1,
        },
        ScalingText
        {
          font = HeaderFont,
          name = "currfundslabel",
          x = hww * 0.8 * 0.625 + 5 - (hww * 0.07),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignRight + kVAlignCenter,
          label = "#$234.321",
          fontScale = 1,
        },
      },

      SetStyle( ButtonStyle ),
      TiledButton
      {
        name = "doit",
        x = (stc1 + stc2 + stc3 + stc4) + (4 * columnSpacing),
        y = sellTableHeight + (hwh * 0.035),
        w = stc5 - 10,
        h = kMax,
        bordersize = 2,
        font = ButtonFont,
        label = "StoreView.SellBtn",
        fontScale = 1,
       
        command = 
          function()
            MakeSale();
          end,
      },
    },
    
    ---------------------------------------------------
    
    TitledFrame
    {
	    name  = "transferview",
      x = 0,
      y = 0,
      w = hww,
      h = kMax,
      
      TiledImage
      {
        name = "static",
        x = 0,
        y = 0,
        w = hww * 0.3,
        h = hwh * 0.06,
        image = "ui_screens/ui_stores/stores_frametop",
        bordersize = 2,

        ScalingText
        {
          font = ButtonFont,
          name = "leftbasename",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "undefined",
          fontScale = 1,
        },
      },

      TiledImage
      {
        name = "static",
        x = kCenter,
        y = hwh * 0.01,
        w = hww * 0.2,
        h = hwh * 0.04,
        image = "ui_screens/ui_stores/stores_frame",
        bordersize = 2,

        ScalingText
        {
          font = HeaderFont,
          name = "eatlabel",
          x = 0,
          y = 0,
          w = kMax,
          h = kMax,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "StoreView.TransitTime",
          fontScale = 1,
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = 0,
        y = hwh * 0.085,
        w = ttc1,
        h = xferTableHeight - (hwh * 0.017),
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.ITEMNAME",
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = ttc1 + columnSpacing * 1,
        y = hwh * 0.085,
        w = ttc2,
        h = xferTableHeight - (hwh * 0.017),
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.QUANTITY",
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = ttc1 + ttc2 + columnSpacing * 2,
        y = hwh * 0.085,
        w = ttc3,
        h = xferTableHeight - (hwh * 0.017),
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.TRANSFER",
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = ttc1 + ttc2 + ttc3 + columnSpacing * 3,
        y = hwh * 0.085,
        w = ttc4,
        h = xferTableHeight - (hwh * 0.017),
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.QUANTITY",
        },
      },
      
      TitledFrame
      {
	      name  = "static",
        x = ttc1 + ttc2 + ttc3 + ttc4 + columnSpacing * 4,
        y = hwh * 0.085,
        w = ttc5 - 10,
        h = xferTableHeight- (hwh * 0.017),
        headimage = "ui_screens/ui_stores/stores_frametop",
        bodyimage = "ui_screens/ui_stores/stores_framebottom",
        bordersize = 2,
        headersize = headerHeight,
        
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 0,
          y = 0,
          w = kMax,
          h = headerHeight,
          fontScale = 1,
  	      flags = kHAlignCenter + kVAlignCenter,
          label = "STOR.COSTOFXFER",
        },
      },

      ListControl
      {
	      name  = "destitems",
        x = 0,
        y = hwh * 0.085 + 5 + headerHeight + 5,
        w = hww,
        h = xferTableHeight - headerHeight - 5,
        font = HeaderFont,
        fontScale = 1,
        drawSelection = false,
        hswl = true,
        
        column1x = 0 + hwh * 0.02,
        column1w = ttc1 - 10,
        column2x = ttc1 + columnSpacing * 1 + 5,
        column2w = ttc2 - 10,
        column3x = ttc1 + ttc2 + columnSpacing * 2 + 5,
        column3w = ttc3 - 10,
        column4x = ttc1 + ttc2 + ttc3 + columnSpacing * 3 + 5,
        column4w = ttc4 - 10,
        column5x = ttc1 + ttc2 + ttc3 + ttc4 + columnSpacing * 4 + 5,
        column5w = ttc5 - 10 - 10,

        TiledImage
        {
          name = "scrollbar",
          x = hww - 9,
          y = 0,
          w = 9,
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

      TiledImage
      {
        name = "static",
        x = (hwh * 0.025),
        y = sellTableHeight + (hwh * 0.035),
        w = (stc1 + stc2 + stc3 + stc4) + (3 * columnSpacing) - (2 * (hwh * 0.025)),
        h = kMax,
        image = "ui_screens/ui_stores/stores_frame",
        bordersize = 2,

        NonUniformScaledImage
        {
          name  = "static",
          x = kCenter + (hwh * 0.02),
          y = kCenter,
          w = hww * 0.8 * 0.20,
          h = 1,
          image = "uitextures/white",
          tint = GrayColor,
        },

        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = 5 + (hwh * 0.025),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignLeft + kVAlignCenter,
          label = "StoreView.TotalTransfer",
          fontScale = 1,
        },
        ScalingText
        {
          font = HeaderFont,
          name = "tcotlabel",
          x =  5 - (hwh * 0.06),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignRight + kVAlignCenter,
          label = "#$132.123.123",
          fontScale = 1,
        },
        ScalingText
        {
          font = HeaderFont,
          name = "static",
          x = hww * 0.8 * 0.625 + 5 + (hww * 0.01),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignLeft + kVAlignCenter,
          label = "StoreView.Funds",
          fontScale = 1,
        },
        ScalingText
        {
          font = HeaderFont,
          name = "currfundslabel",
          x = hww * 0.8 * 0.625 + 5 - (hww * 0.07),
          y = 0,
          w = hww * 0.8 * 0.37 - 5,
          h = kMax,
  	      flags = kHAlignRight + kVAlignCenter,
          label = "#$234.321",
          fontScale = 1,
        },
      },

      SetStyle( ButtonStyle ),
      TiledButton
      {
        name = "doit2",
        x = (stc1 + stc2 + stc3 + stc4) + (4 * columnSpacing),
        y = sellTableHeight + (hwh * 0.035),
        w = ttc5 - 10,
        h = kMax,
        bordersize = 2,
        font = ButtonFont,
        label = "StoreView.TransferBtn",
        fontScale = 1,
       
        command = 
          function()
            MakeSale();
          end,
      },

      ComboBox
      {
        name = "dstbase",
        x = hww * 0.69,
        y = 0,
        w = kMax - 10,
        h = hwh * 0.3,

        TiledImage
        {
          name = "listcontrolbg",
          x = 0,
          y = 0,
          w = kMax,
          h = hwh * 0.06,
          image = "ui_screens/ui_stores/stores_frametop",
          bordersize = 2,

          ScalingText
          {
            font = ButtonFont,
            name = "textlabel",
            x = (hwh * 0.02),
            y = 0,
            w = kMax,
            h = kMax,
            flags = kHAlignLeft + kVAlignCenter,
            label = "",
            fontScale = 1,
          },
        },

        SetStyle( ComboButtonStyle ),
        TiledButton
        {      
          name = "combobutton",
          x = kMax - hwh * 0.06 + 3,
          y = 3,
          w = kMax - 3,
          h = hwh * 0.06 - 6,
          bordersize = 2,
    	      
          command = 
            function()
            end,
        },
        TiledImage
        {
          name = "listcontrolbg",
          x = 0,
          y = hwh * 0.06,
          w = kMax,
          h = kMax,
          image = "ui_screens/ui_stores/stores_frametop",
          bordersize = 4,

          ListControl
          {
            name = "listcontrol",
            x = 0,
            y = 0,
            w = kMax,
            h = kMax,
            font = HeaderFont,
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
    },
  }
}
