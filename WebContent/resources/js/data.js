/*
   Deluxe Menu Data File
   Created by Deluxe Tuner v3.10
   http://deluxe-menu.com
*/



//--- Common
var menuIdentifier="dark-orange-menu";
var isHorizontal=1;
var smColumns=1;
var smOrientation=0;
var dmRTL=0;
var pressedItem=-2;
var itemCursor="pointer";
var itemTarget="_self";
var statusString="link";
var blankImage="dark-orange-menu.files/blank.gif";
var pathPrefix_img="";
var pathPrefix_link="";

//--- Dimensions
var menuWidth="";
var menuHeight="";
var smWidth="";
var smHeight="";

//--- Positioning
var absolutePos=0;
var posX="10px";
var posY="10px";
var topDX=0;
var topDY=-6;
var DX=0;
var DY=0;
var subMenuAlign="left";
var subMenuVAlign="top";

//--- Font
var fontStyle=["normal 13px Arial Narrow,Arial,Sans-Serif","normal 13px Arial Narrow,Arial,Sans-Serif"];
var fontColor=["#FFFFFF","#FFFFFF"];
var fontDecoration=["none","none"];
var fontColorDisabled="#AAAAAA";

//--- Appearance
var menuBackColor="transparent";
var menuBackImage="";
var menuBackRepeat="repeat";
var menuBorderColor="#C0AF62";
var menuBorderWidth="0px";
var menuBorderStyle="none";
var smFrameImage="";
var smFrameWidth=0;

//--- Item Appearance
var itemBackColor=["#1B170E","#FF8200"];
var itemBackImage=["",""];
var itemSlideBack=0;
var beforeItemImage=["",""];
var afterItemImage=["",""];
var beforeItemImageW="";
var afterItemImageW="";
var beforeItemImageH="";
var afterItemImageH="";
var itemBorderWidth="1px 0px 0px 0px";
var itemBorderColor=["#FF8200","#1B170E"];
var itemBorderStyle=["solid","solid"];
var itemSpacing=0;
var itemPadding="0px 20px 7px 0px";
var itemAlignTop="left";
var itemAlign="left";

//--- Icons
var iconTopWidth="";
var iconTopHeight="";
var iconWidth="";
var iconHeight="";
var arrowWidth=9;
var arrowHeight=7;
var arrowImageMain=["dark-orange-menu.files/arrow.gif","dark-orange-menu.files/arrowmaino.gif"];
var arrowWidthSub=8;
var arrowHeightSub=16;
var arrowImageSub=["dark-orange-menu.files/arrowsub.gif","dark-orange-menu.files/arrowsubo.gif"];

//--- Separators
var separatorImage="";
var separatorColor="";
var separatorWidth="100%";
var separatorHeight="0px";
var separatorAlignment="left";
var separatorVImage="dark-orange-menu.files/sep.gif";
var separatorVColor="";
var separatorVWidth="1px";
var separatorVHeight="45px";
var separatorPadding="0px";

//--- Floatable Menu
var floatable=0;
var floatIterations=6;
var floatableX=1;
var floatableY=1;
var floatableDX=15;
var floatableDY=15;

//--- Movable Menu
var movable=0;
var moveWidth=12;
var moveHeight=20;
var moveColor="#DECA9A";
var moveImage="";
var moveCursor="move";
var smMovable=0;
var closeBtnW=15;
var closeBtnH=15;
var closeBtn="";

//--- Transitional Effects & Filters
var transparency="100";
var transition=105;
var transOptions="";
var transDuration=350;
var transDuration2=200;
var shadowLen=0;
var shadowColor="#B1B1B1";
var shadowTop=0;

//--- CSS Support (CSS-based Menu)
var cssStyle=0;
var cssSubmenu="";
var cssItem=["",""];
var cssItemText=["",""];

//--- Advanced
var dmObjectsCheck=0;
var saveNavigationPath=1;
var showByClick=0;
var noWrap=1;
var smShowPause=200;
var smHidePause=1000;
var smSmartScroll=1;
var topSmartScroll=0;
var smHideOnClick=1;
var dm_writeAll=1;
var useIFRAME=0;
var dmSearch=0;

//--- AJAX-like Technology
var dmAJAX=0;
var dmAJAXCount=0;
var ajaxReload=0;

//--- Dynamic Menu
var dynamic=0;

//--- Popup Menu
var popupMode=0;

//--- Keystrokes Support
var keystrokes=0;
var dm_focus=1;
var dm_actKey=113;

//--- Sound
var onOverSnd="";
var onClickSnd="";

var itemStyles = [
    ["itemHeight=45px","itemBackColor=#322E23,#FF8200","itemBackImage=dark-orange-menu.files/left-normal.png,dark-orange-menu.files/left-over.png","itemSlideBack=20","itemBorderWidth=0px","itemBorderStyle=none,none","fontStyle='normal 14px Arial Narrow,Arial,Sans-Serif','normal 14px Arial Narrow,Arial,Sans-Serif'","fontColor=#FFFFFF,#FFFFFF","fontDecoration=none,none"],
    ["itemHeight=45px","itemBackColor=#322E23,#FF8200","itemBackImage=dark-orange-menu.files/right-normal.png,dark-orange-menu.files/right-over.png","itemSlideBack=20","itemBorderWidth=0px","itemBorderStyle=none,none","fontStyle='normal 14px Arial Narrow,Arial,Sans-Serif','normal 14px Arial Narrow,Arial,Sans-Serif'","fontColor=#FFFFFF,#FFFFFF","fontDecoration=none,none"],
    ["itemHeight=45px","itemBackColor=#322E23,#FF8200","itemBackImage=dark-orange-menu.files/back-normal.png,dark-orange-menu.files/back-over.png","itemSlideBack=20","itemBorderWidth=0px","itemBorderStyle=none,none","fontStyle='normal 14px Arial Narrow,Arial,Sans-Serif','normal 14px Arial Narrow,Arial,Sans-Serif'","fontColor=#FFFFFF,#FFFFFF","fontDecoration=none,none"],
];
var menuStyles = [
    ["menuBackColor=#1B170E","menuBorderWidth=0px","menuBorderStyle=none","itemSpacing=3","itemPadding=7px"],
];
dm_init();