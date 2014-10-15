import luxe.Input;
import luxe.Color;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;
import luxe.Audio;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Text;
import luxe.Text;


class Main extends luxe.Game {
    var _piano_k : Texture;
    var piano_key1: Sprite;
    var piano_key2: Sprite;
    var piano_key3: Sprite;
    var piano_key4: Sprite;
    var piano_key5: Sprite;
    var piano_key6: Sprite;
    var piano_key7: Sprite;
    var mouseX:Float;
    var mouseY:Float;
    var pianoWidth: Float;
    var pianoMaxWidth: Float;
    var pianoIndent:Float;
    var pianoXStart:Float;
    var pianoHeight:Float;

    override function ready() {

        pianoWidth = 50;
        pianoMaxWidth = 100;
        pianoIndent = 50;
        pianoXStart = 25;
        pianoHeight = 311;

        _piano_k = Luxe.loadTexture('assets/piano_key.png');
        _piano_k.onload = createPianoKeys;

        createSounds();

    } //ready

    function createSounds () {
         Luxe.audio.create('assets/octave_a.ogg', "octave_a");
         Luxe.audio.create('assets/octave_b.ogg', "octave_b");
         Luxe.audio.create('assets/octave_c.ogg', "octave_c");
         Luxe.audio.create('assets/octave_d.ogg', "octave_d");
         Luxe.audio.create('assets/octave_e.ogg', "octave_e");
         Luxe.audio.create('assets/octave_f.ogg', "octave_f");
         Luxe.audio.create('assets/octave_g.ogg', "octave_g");
    }

    function createPianoKeys (_){
        var pianoX = Luxe.screen.h / 2;
        var pianoY = Luxe.screen.w / 2;
        piano_key1 = new Sprite ({
            name: "do",
            texture: _piano_k,
            pos: new Vector (pianoX,pianoY),
            size: new Vector (50, 311),
            });
            piano_key2 = new Sprite ({
            name: "re",
            texture: _piano_k,
            pos: new Vector (pianoX+50,pianoY),
            size: new Vector (50, 311),
            });
            piano_key3 = new Sprite ({
            name: "mi",
            texture: _piano_k,
            pos: new Vector (pianoX+50*2,pianoY),
            size: new Vector (50, 311),
            });
            piano_key4 = new Sprite ({
            name: "fa",
            texture: _piano_k,
            pos: new Vector (pianoX+50*3,pianoY),
            size: new Vector (50, 311),
            });
            piano_key5 = new Sprite ({
            name: "sol",
            texture: _piano_k,
            pos: new Vector (pianoX+50*4,pianoY),
            size: new Vector (50, 311),
            });
            piano_key6 = new Sprite ({
            name: "la",
            texture: _piano_k,
            pos: new Vector (pianoX+50*5,pianoY),
            size: new Vector (50, 311),
            });
            piano_key7 = new Sprite ({
            name: "si",
            texture: _piano_k,
            pos: new Vector (pianoX+50*6,pianoY),
            size: new Vector (50, 311),
            });
        piano_key1.flipx = true;
        piano_key3.flipx = true;
        piano_key5.flipx = true;
        piano_key7.flipx = true;
    } //onthunder

    function clickPiano (){
        Luxe.input.add ("click", MouseButton.left);
    } 

    function clickPianoKeys (numberPiano: Sprite, nubmerSound: String)
    {
     if(mouseX >= numberPiano.pos.x - pianoXStart &&
         mouseX <= numberPiano.pos.x + pianoWidth /2 &&
          mouseY >= numberPiano.pos.y - pianoHeight/2 &&
           mouseY <= numberPiano.pos.x + pianoHeight &&
            Luxe.input.mousepressed (1)) {
            Luxe.audio.play(nubmerSound);
        }
    }

    override function update( delta:Float ) {
        clickPianoKeys (piano_key1, "octave_a");
        clickPianoKeys (piano_key2, "octave_b");
        clickPianoKeys (piano_key3, "octave_c");
        clickPianoKeys (piano_key4, "octave_d");
        clickPianoKeys (piano_key5, "octave_e");
        clickPianoKeys (piano_key6, "octave_f");
        clickPianoKeys (piano_key7, "octave_g");
        
    } //update

    override function onkeyup( e:KeyEvent ) {


    } //onkeyup

    override function onmousemove (e: MouseEvent) {
        mouseX = e.pos.x;
        mouseY = e.pos.y;
    }


} //Main



