//Klasa za gumb za stisavanje zvuka
  class ButtonPause extends AbstractButton {
    void doFunction(){
        if(mute){
          mute=false;
          kon=stisaj;
          background_music.play();
        }
        else{
          mute=true;
          kon=zvuk;
          background_music.pause();
        }
      }
    }
