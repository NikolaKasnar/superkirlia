// Klasa za gumb za stisavanje zvuka
  class ButtonPause extends AbstractButton {
    void doFunction() {
        if (mute) {
            mute = false;
            kon = stisaj;
            if (currentLevel == 5) { // Check current level for boss music
                boss_music.play();
            } else {
                background_music.loop();
            }
        } else {
            mute = true;
            kon = zvuk;
            boss_music.stop();
            background_music.stop();
        }
    }
}
