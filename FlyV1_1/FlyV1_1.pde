int scl = 30;
int rows, colums;
int terrainWidth = 2000;
int terrainlenght = 2000;
float [][] terrain;
float flyingSpeed = 0;
float perspective;

void setup(){
    size(1000,800,P3D);
    columns=terrainWidth/gridscale;
    rows=terrainlenght/gridscale;
    terrain = new float [rows][columns];
    
    
    
}

void draw(){
    background(0);
    noStroke();
    colorMode(RGB);
    fill(220,160,40);
    directionalLight(70,70,90,1500,1000,1500);
    float yoff=flyingSpeed;
    for (int y=0; y<rows; y++){
        perspective= y*0.05;
        float xoff=0;
        for ( int x=0; x<columns; x++){
            terrain [x][y] = map(noise(xoff,yoff),0,1,-50*perspective,50*perspective);
            xoff-=0.05;
        }
        yoff-=0.05;
    }
    
    translate(width/2, height/2);
    rotateX(radians(80));
    translate(-terrainWidth/2,-1520);
    
    for (int y = 0 ; y < rows-1 ; y++){
        beginShape(TRIANGLE_STRIP);
        for(int x=0 ; x<columns ; x++){
            vertex(x*gridscale,y*gridscale,terrain[x][y]);
            vertex(x*gridscale,(y+1)*gridscale,terrain[x][y+1]);
        }
        endShape();
    }
    flyingSpeed+=0.05;
}
