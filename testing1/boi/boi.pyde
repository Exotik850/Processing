def setup():
    size(300, 300)
    background(51)
    
zoff = 0    

def draw():
    global zoff
    stroke(255)
    strokeWeight(4)
    beginShape()
    a = 0
    translate(width / 2, height / 2)
    while a < TWO_PI:
        xoff = map(cos(a), 0, 1, 0, 3)
        yoff = map(sin(a), 0, 1, 0, 3)
        r = 100 * noise(xoff, yoff)
        x = cos(a) * r
        y = sin(a) * r
        vertex(x,y)
        a += PI / 200
        
    endShape()
        
