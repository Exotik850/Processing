class Ball:
    def __init__(self, pos, vel, acc):
        self.pos = pos
        self.vel = vel
        self.acc = acc
    
    def update(self):
        self.mouse = PVector(mouseX, mouseY)
        self.acc.add(self.mouse.sub(self.pos))
        self.acc.setMag(0.1)
        self.is_close()
        self.vel.add(self.acc)
        self.vel.limit(1)
        self.pos.add(self.vel)
        
    def is_close(self):
        self.mouse = PVector(mouseX, mouseY)
        if (self.pos.x < (self.mouse.x + 10)) or (self.pos.x > (self.mouse.x - 10)):
            if (self.pos.y < (self.mouse.y + 10)) or (self.pos.y > (self.mouse.y - 10)):
                self.acc.mult(1)
                
    def show(self):
        ellipse(self.pos.x, self.pos.y, 5, 5)
