int scl = 30;
int rows, cols;
int w = 2000;
int h = 2000;
float [][] terrain;
float flying = 0;
float perspective;

void setup(){
    size(1000,800,P3D);
    cols=w/scl;
    rows=h/scl;
    terrain = new float [rows][cols];
    
    
    
}

void draw(){
    background(0);
    colorMode(RGB);
    fill(220,160,40);
    //directionalLight();
    float yoff=flying;
    for (int y=0; y<rows; y++){
        perspective= y*0.05;
        float xoff=0;
        for ( int x=0; x<cols; x++){
            terrain [x][y] = map(noise(xoff,yoff),0,1,-50*perspective,50*perspective);
            xoff-=0.1;
        }
        yoff-=0.1;
    }
    translate(width/2, height/2);
    rotateX(radians(80));
    translate(-w/2,-1520);
    
    for (int y = 0 ; y < rows-1 ; y++){
        beginShape(TRIANGLE_STRIP);
        for(int x=0 ; x<cols ; x++){
            vertex(x*scl,y*scl,terrain[x][y]);
            vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
        }
        endShape();
    }
    flying+=0.1;
}