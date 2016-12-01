require "gosu"

G = 6.674e-11

class Body

  attr_accessor :x, :y, :vel_x, :vel_y, :mass, :image, :force_x, :force_y

  def initialize(x, y, vel_x, vel_y, mass, image)
    @x = x.to_f
    @y = y.to_f
    @vel_x = vel_x.to_f
    @vel_y = vel_y.to_f
    @mass = mass.to_f
    file = "images/" + image
    @image = Gosu::Image.new(file)
    # puts x
    # puts y
    @force_x = 0.0
    @force_y = 0.0
  end

  def draw
    @image.draw_rot(x.to_f + 320, y.to_f + 320, 1, 90.0)
  end

  def calculate_force(bodies)
    bodies.each do |body|
      if image != body.image
        r = calculate_r(body)
        r = r.to_f
        force_on = (G * mass * body.mass) / (r ** 2)
        force_x = force_x.to_f + (force_on.to_f * (body.x - x).abs) / r
        force_y = force_x.to_f + (force_on.to_f * (body.y - y).abs) / r
      end
    end
  end

  def calculate_position
    x = calculate(force_x, vel_x, x)
    y = calculate(force_y, vel_y, y)
  end

  def calculate(force, vel, pos)
    a = force / mass
    v = vel + a * 25000
    return pos.to_f + v * 25000

  end

  def calculate_r(body)
    x1 = body.x.to_f
    y1 = body.y.to_f
    a = (x1 - @x) ** 2 + (y1 - @y) ** 2
    return Math.sqrt(a)
  end

end
