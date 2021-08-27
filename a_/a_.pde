
int dim=10,n;
point points[][];
ArrayList<point> openSet,closeSet;
point getmin(ArrayList<point> openSet){
  int min=openSet.get(0).val;
  int ind=0;
  for (int i=0;i<openSet.size();i++){
    if(openSet.get(i).val<min){
     min=openSet.get(i).val; 
     ind =i;
    }
  }
  return openSet.get(ind);
}
void addneighbours(point a,ArrayList<point> openSet){
  //println(points[(a.x+dim)/dim][a.y/dim].val+" "+a.g+points[(a.x+dim)/dim][a.y/dim].h);
  if(a.x-dim>=0 && points[(a.x-dim)/dim][a.y/dim].col!='o' && !closeSet.contains(points[(a.x-dim)/dim][a.y/dim]) && points[(a.x-dim)/dim][a.y/dim].val>(1+a.g+points[(a.x-dim)/dim][a.y/dim].h)){
    points[(a.x-dim)/dim][a.y/dim].g=a.g+1;
    points[(a.x-dim)/dim][a.y/dim].update();
    openSet.add(points[(a.x-dim)/dim][a.y/dim]);
    points[(a.x-dim)/dim][a.y/dim].col='g';
  }
  if(a.x+dim<400 && points[(a.x+dim)/dim][a.y/dim].col!='o' && !closeSet.contains(points[(a.x+dim)/dim][a.y/dim]) && points[(a.x+dim)/dim][a.y/dim].val>(1+a.g+points[(a.x+dim)/dim][a.y/dim].h)){
    
    points[(a.x+dim)/dim][a.y/dim].g=a.g+1;
    points[(a.x+dim)/dim][a.y/dim].update();
    openSet.add(points[(a.x+dim)/dim][a.y/dim]);
    points[(a.x+dim)/dim][a.y/dim].col='g';
  }
  if(a.y-dim>=0 && points[a.x/dim][(a.y-dim)/dim].col!='o' && !closeSet.contains(points[a.x/dim][(a.y-dim)/dim]) && points[a.x/dim][(a.y-dim)/dim].val>(1+a.g+points[a.x/dim][(a.y-dim)/dim].h)){
    points[a.x/dim][(a.y-dim)/dim].g=a.g+1;
    points[a.x/dim][(a.y-dim)/dim].update();
    openSet.add(points[a.x/dim][(a.y-dim)/dim]);
    points[a.x/dim][(a.y-dim)/dim].col='g';
  }
  if(a.y+dim<400 && points[a.x/dim][(a.y+dim)/dim].col!='o' && !closeSet.contains(points[a.x/dim][(a.y+dim)/dim]) && points[a.x/dim][(a.y+dim)/dim].val>(1+a.g+points[a.x/dim][(a.y+dim)/dim].h)){
    points[a.x/dim][(a.y+dim)/dim].g=a.g+1;
    points[a.x/dim][(a.y+dim)/dim].update();
    openSet.add(points[a.x/dim][(a.y+dim)/dim]);
    points[a.x/dim][(a.y+dim)/dim].col='g';
  }
}
void setup(){
 size(400,400); 
  n=400/dim;
  
 points=new point[n][n];
 for(int i=0;i<n;i++){
   for(int j=0;j<n;j++){
    points[i][j]=new point(i*dim,j*dim,dim);
    if(random(1)<.2){
    points[i][j].col='o';
    }
   }
 }
 openSet= new ArrayList<point>(n*n);
 closeSet= new ArrayList<point>(n*n);
 points[0][0].g=0;
 points[0][0].update();
 openSet.add(points[0][0]);
 points[0][0].col='g';
}

void draw(){
  //background(0);
  if(!openSet.isEmpty()){
    point a=getmin(openSet);
    //println(a.x+" "+a.y);
    if(a==points[n-1][n-1])
    noLoop();
     addneighbours(a,openSet);
     //println(openSet.size());
     closeSet.add(a);
     a.col='r';
     openSet.remove(a);
  for(int i=0;i<n;i++){
   for(int j=0;j<n;j++){
   points[i][j].show();
   }
  }
  }
  else
  noLoop();
}
