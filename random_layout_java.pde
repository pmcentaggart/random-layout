import processing.pdf.*;

int shape_total=8 ;
int max_size=120;
float[] x_pos=new float[shape_total];
float[] y_pos= new float[shape_total];


void setup() {
size(1000,800);
background(255);
beginRecord(PDF,"random-layout.pdf");
  fill(0);
     x_pos[0]=(width/2); 
     y_pos[0]=(height/2);
   for (int i = 1; i < shape_total; i++) {
        float ran_x=0;
        float ran_y=0;
        int yn=1;
      while (yn==1) {
           yn=0;
           if(i<(shape_total+1)/2){
             ran_y=random((height/2)-100,(height/2)-50);
           }else{
             ran_y=random((height/2)+50,(height/2)+100);
           }
           ran_x=random(100,(width-100));

            for (int j = 0; j < x_pos.length; j++) {
             if(dist(ran_x,ran_y,x_pos[j],y_pos[j])<max_size){
               yn=1; 
             }
            }
      }
     x_pos[i]=ran_x; 
     y_pos[i]=ran_y; 
    }
    
      
println(x_pos);
println(y_pos);
       ellipse(x_pos[0],y_pos[0], max_size,max_size);
       for (int i = 1; i < shape_total; i++) {
          float e_size=random(30,max_size-20);
          ellipse(x_pos[i],y_pos[i], e_size,e_size);
       }
endRecord();
}