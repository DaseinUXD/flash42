/**
 * Copyright markmatthewsphd ( http://wonderfl.net/user/markmatthewsphd )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * Downloaded from: http://wonderfl.net/c/pTY0
 */

// forked from Dorara's トランプ並べ(確認用標準サイズ) forked from: トランプ
// forked from Dorara's トランプ並べ forked from: トランプ
// forked from Dorara's トランプ
//トランプならべ
//   配置されたカードはドラッグして動かせます。
package {
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.events.Event;

    [SWF(width="465", height="465",backgroundColor=0x00000000,frameRate=60)]
    public class createCARD extends Sprite
    {
        private var mycard:myCARD;
        private var cardarray:Array;
        private var cnumb:int;
        private var ctype:int;
        
        public function createCARD()
        {
            this.stage.scaleMode = StageScaleMode.NO_SCALE;
            this.stage.align = StageAlign.TOP_LEFT;
            
            cardarray = new Array(4);
            mycard = new myCARD();
            for(var i:int = 0; i<4; i++){
                var cardlist:Array = new Array(13);
                cardarray[i] = cardlist;
                for(var j:int = 1; j<14; j++){
                    var scard:Sprite = new Sprite();
                    //カードの生成createCard(番号(1-13), 種類(0:スペード,1:クローバー,2:ダイア,3:ハート))
                    var card:Bitmap = mycard.createCard(j, i);
                    //表示
                    //card.scaleX = 0.34;
                    //card.scaleY = 0.34;
                    card.x = 0;
                    card.y = 0;
                    scard.addChild(card);
                    scard.x = 200;
                    scard.y = 300;
                    addChild(scard);
                    cardarray[i][j-1] = scard;
                }
            }
            
            cnumb = 0;
            ctype = 0;
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
        
        private function onEnterFrame(e:Event):void {
            var distx:int = (cnumb*34+1) - cardarray[ctype][cnumb].x;
            var disty:int = (ctype*51+1) - cardarray[ctype][cnumb].y;
            if(distx<0) distx = -distx;
            if(disty<0) disty = -disty;
            if(distx>0||disty>0){
                cardarray[ctype][cnumb].x += ((cnumb*34+1) - cardarray[ctype][cnumb].x)/5;
                cardarray[ctype][cnumb].y += ((ctype*51+1) - cardarray[ctype][cnumb].y)/5;
            }else{
                cardarray[ctype][cnumb].addEventListener(MouseEvent.MOUSE_DOWN, SstartDrag);
                cardarray[ctype][cnumb].addEventListener(MouseEvent.MOUSE_UP, SstopDrag);
                
                cnumb++;
                if(cnumb==13){
                    ctype++;
                    if(ctype==4){
                        removeEventListener(Event.ENTER_FRAME, onEnterFrame);
                    }
                    cnumb=0;
                }
            }    
        }
        private function SstartDrag(e:MouseEvent):void{
            this.setChildIndex((Sprite)(e.currentTarget), this.numChildren-1);
            e.currentTarget.startDrag();
        }
        private function SstopDrag(e:MouseEvent):void{
            e.currentTarget.stopDrag();
        }
    }
    
}


import flash.display.Sprite;
import flash.text.TextField;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.text.TextFormat;
    

class myCARD {
    private var cardtype:Array = ["♠", "♣", "♦", "♥"];
    private var cardnumb:Array = ["-","A","2","3","4","5","6","7","8","9","10","J","Q","K"];
    private var pn:Array = [0,0x4000,0x3000,0x4c00,0x2d0,0x42d0,0x3f0,0x23f0,0x2df,0x22df,0x32df];
    private var px:Array = [40,40,40,40,40,20,20,20,60,60,60,20,20,60,60];
    private var py:Array = [75,45,105,25,125,25,75,125,25,75,125,60,95,60,95];
    //カード生成
    public function createCard(number:int, type:int):Bitmap {
        var ret:Sprite = new Sprite();
        var retBitmap:Bitmap = new Bitmap();
        var retBitmapD:BitmapData = new BitmapData(100, 150, true, 0x000000);
        var tmpbmpD:BitmapData = new BitmapData(100, 150, true, 0x000000);
        var tmpbmp:Bitmap = new Bitmap();
        var tmpsp:Sprite = new Sprite();
        var textFormat:TextFormat = new TextFormat();
        textFormat.size = 23;
        if(type == 0 || type == 1){textFormat.color = 0x000000;}
        else {textFormat.color = 0xff0000;}
        
        //外枠
        tmpsp.graphics.beginFill(0x000000);
        tmpsp.graphics.drawRoundRect(0, 0, 100, 150, 20, 20);
        tmpsp.graphics.endFill();
        tmpbmpD.draw(tmpsp);
        tmpsp.graphics.beginFill(0xffffff);
        tmpsp.graphics.drawRoundRect(2, 2, 98, 148, 20, 20);
        tmpsp.graphics.endFill();
        tmpbmpD.draw(tmpsp);

        {//右下のナンバーと記号
            var ntext1:TextField = new TextField();
            ntext1.defaultTextFormat = textFormat;
            ntext1.text = cardnumb[number] + "\n" + cardtype[type];
            ntext1.x = 0;
            ntext1.y = 0;
            tmpbmpD.draw(ntext1);
            tmpbmp.bitmapData = tmpbmpD;
            tmpbmp.rotation = 180;
            tmpbmp.x = 100;
            tmpbmp.y = 150;
            ret.addChild(tmpbmp);
        }
        //カード内部
        if(1 <= number && number <= 10){
            var b:uint = pn[number];
            var comp:uint = 0x4000;
            var cmped:uint;
            for(var i:int = 0; i<15; i++){
                cmped = b & comp;
                if(cmped > 0){
                    var kigou:TextField = new TextField();
                    kigou.defaultTextFormat = textFormat;
                    kigou.text = cardtype[type];
                    kigou.x = px[i] - 3;
                    kigou.y = py[i] - 10;
                    ret.addChild(kigou);
                }
                comp = comp >> 1;
            }

        }
        else if(11 <= number && number <= 13){
            var gara:Sprite = new Sprite();
            gara.graphics.beginFill(0xcccccc);
            gara.graphics.drawRect(25,25,50,100);
            gara.graphics.endFill();
            ret.addChild(gara);
        }
        
        {//左上のナンバーと記号
            var ntext2:TextField = new TextField();
            ntext2.defaultTextFormat = textFormat;
            ntext2.text = cardnumb[number] + "\n" + cardtype[type];
            ntext2.x = 0;
            ntext2.y = 0;
            ret.addChild(ntext2);
        }

        retBitmapD.draw(ret);
        retBitmap.bitmapData = retBitmapD;
        return retBitmap;
    }
}
