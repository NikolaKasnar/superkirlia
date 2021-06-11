//Funkcija koja se poziva kad se pritisne tipka na misu
 void mousePressed() {
   
  
    if (flag == 0) { //ukoliko se nalazimo u meni-ju
          menuButton.mousePressed();
          exitButton.mousePressed();
          
          } else if (flag == 1) { //ukoliko smo na nekom levelu igre
              l.mousePressed();
              
          }else if( flag == 2){ //ukoliko smo između levela, program ne radi ništa
          
           }else if(flag == 3 || flag == 4){ //ukoliko smo na pobjedničkom/gubitničkom ekranu
              // klik nas vraća na meni
              flag = 0;
          
             //......reset levela tako da se omogući ponovno igranje....
             l.resetlevel();
             l2.resetlevel();
             currentLevel=0;
           }
  }
  
//Funkcija koja se poziva kad se pritisne tipka na tipkovnici
 void keyPressed() {
    l.keyPressed();
    l2.keyPressed();
     }
  
//Funckija koja se zove kad se otpusti tipka na tipkovnici
 void keyReleased() {
    l.keyReleased();
    l2.keyReleased();
    }
