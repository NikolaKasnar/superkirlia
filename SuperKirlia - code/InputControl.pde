//Funkcija koja se poziva kad se pritisne tipka na misu
 void mousePressed() {
   
  
    if (flag == 0) { //ukoliko se nalazimo u meni-ju
          menuButton.mousePressed();
          exitButton.mousePressed();
          
          } else if (flag == 1) { //ukoliko smo na nekom levelu igre
              l.mousePressed();
              pauseButton.mousePressed();
              
          }else if( flag == 2){ //ukoliko smo između levela, program ne radi ništa
          
           }else if(flag == 3 || flag == 4){ //ukoliko smo na pobjedničkom/gubitničkom ekranu
              // klik nas vraća na meni
              flag = 0;
          
             //......reset levela tako da se omogući ponovno igranje....
             l.resetlevel(0);
             l2.resetlevel(1);
             l3.resetlevel(2);
             l4.resetlevel(3);
             l5.resetlevel(4);
             l6.resetlevel(5);
             currentLevel=0;
           }
  }
  
//Funkcija koja se poziva kad se pritisne tipka na tipkovnici
 void keyPressed() {
    if(flag==0 & keyCode==ENTER){
      flag=1;
      l.resetlevel(0);
      l2.resetlevel(1);
      l3.resetlevel(2);
      l4.resetlevel(3);
      l5.resetlevel(4);
      l6.resetlevel(5);
      currentLevel=0;
    }
    if((flag==3 || flag==4) & keyCode==ENTER){
      flag=0;
      l.resetlevel(0);
      l2.resetlevel(1);
      l3.resetlevel(2);
      l4.resetlevel(4);
      l5.resetlevel(4);
      l6.resetlevel(4);
      
      currentLevel=0;
    }
    l.keyPressed();
    l2.keyPressed();
    l3.keyPressed();
    l4.keyPressed();
     }
  
//Funckija koja se zove kad se otpusti tipka na tipkovnici
 void keyReleased() {
    l.keyReleased();
    l2.keyReleased();
    l3.keyReleased();
    l4.keyReleased();
    }
