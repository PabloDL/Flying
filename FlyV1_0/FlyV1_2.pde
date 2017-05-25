int scl = 20;
int rows, cols;
int w = 2000;
int h = 2000;
float [][] terrain;
float flying = 0;
float perspective;
float persAcc;
PImage bg;

void setup(){
    size(1200,800,P3D);
    cols=w/scl;
    rows=h/scl;
    terrain = new float [rows][cols];
    bg= loadImage("nightSky2.1.jpg"); 
    
    
    
}

void draw(){
    background(bg);
    noStroke();
    colorMode(HSB);
    fill(20,150,150);
    directionalLight(70,70,70,1500,1000,2000);
    float yoff=flying;
    for (int y=0; y<rows; y++){
        perspective=map(y,0,70,0.3,2.5);
        float xoff=0;
        for ( int x=0; x<cols; x++){
            terrain [x][y] = map(noise(xoff,yoff),0,1,-50*perspective,50*perspective);
            xoff-=0.06;
        }
        yoff-=0.06;
    }
    
    translate(width/2, height/2);
    rotateX(radians(83));
    translate(-w/2,-1520);
    
    for (int y = 0 ; y < rows-1 ; y++){
        beginShape(TRIANGLE_STRIP);
        for(int x=0 ; x<cols ; x++){
            vertex(x*scl,y*scl,terrain[x][y]);
            vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
        }
        endShape();
    }
    flying+=0.06;
}
