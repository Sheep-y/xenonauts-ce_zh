require "scripts/style"

local messageText = "undefined";

if ( gDialogTable.messageText ) then
	messageText = gDialogTable.messageText;
end

MakeDialog
{
	name = "messagebox",
	MessageDialog
	{
 	  x = kCenter,
    y = kCenter,
    
    fit = true,
	movable = true,
    
	  TiledImage
	  {
		  name  = "backgroundimage",
  		w     = 300 * screenScaleX,
  		h     = 150 * screenScaleY,
  		bordersize = 2,
  		
  		sizetochildren = true,
  		sizetochildrenborder = 5,
  		
      ScalingText
      {
        name = "label",
        x = 5,
        y = 5,
        w = kMax - 5,
        h = 28 * 2 * screenScaleY,
        flags = kHAlignCenter + kVAlignCenter,
        label = messageText,
        font = XenonautsLabelFontWhite11,
        fontScale = 1.2 * screenScaleY,
      },
        
      SetStyle( XenonautsTiledButton2Style ),
      TiledButton
      {
        name = "cancel",
        default = true,
        cancel = true,
        x = 5,
        y = 0,
        w = kMax - 5,
        h = 20 * screenScaleY,
    		bordersize = 2,
        label = "OK",
        font = XenonautsLabelFontMedium,
        fontScale = 1.2 * screenScaleY,
        
        command = 
          function()
	          PopModal( "messagebox" );
	          MessageBoxClosed();
          end,
      },
	  },
	},
}

gDialogTable = {}