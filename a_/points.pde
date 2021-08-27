class point{
 int x,y,dim,col,h,g,val;
 point(int x,int y,int dim){
   this.x=x;
   this.y=y;
   this.dim=dim;
   this.col='w';
   //this.h=Math.abs(390-x)+Math.abs(390-y);
   this.h=int(sqrt((390-x)*(390-x)+(390-y)*(390-y)));
   this.g=999999;
   this.val=this.h+this.g;
 }
 void update(){
  val=g+h; 
 }
 void show(){
  if(col=='w'){
  fill(255,255,255);
  rect(x,y,dim,dim);
  }
  else if(col=='r'){
  fill(255,0,0);
  rect(x,y,dim,dim);
  }
  else if(col=='g'){
  fill(0,255,0);
  rect(x,y,dim,dim);
  }
  else if(col=='o'){
  fill(0,0,0);
  rect(x,y,dim,dim);
  }
 }
}
