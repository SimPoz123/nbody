require "gosu"

G = 6.674e-11

class Body

  attr_accessor :image, :x, :y, :mass

  def initialize(x, y, vel_x, vel_y, mass, image, radius)
    @x = x.to_f
    @y = y.to_f
    @vel_x = vel_x.to_f
    @vel_y = vel_y.to_f
    @mass = mass.to_f
    file = "images/" + image
    @image = Gosu::Image.new(file)
    @size = radius * 2
    @acc_x = @acc_y = @force_x = @force_y = @scaled_x = @scaled_y
  end

  def draw
    image.draw(@scaled_x.to_f - image.width / 2.0 - 320, @scaled_y.to_f - image.height / 2.0 - 320, 1)
  end

  def calculate_force(body)
    distance_x = @x - body.x
    distance_y = @y - body.y

    r = Math.sqrt(distance_x ** 2 + distance_y ** 2)

    force_on = ((G * @mass * body.mass) / r**2).to_f
    @force_x = @force_x.to_f - (force_on * (x - body.x)) / r
		@force_y = @force_y.to_f - (force_on * (y - body.y)) / r

  end

  def calc_acc
    @acc_x = @force_x.to_f / @mass
    @acc_y = @force_y.to_f / @mass

    @force_x = @force_y = 0
  end

  def calc_velocity
    @vel_x = @vel_x.to_f + 25000 * @acc_x.to_f
    @vel_y = @vel_y.to_f + 25000 * @acc_y.to_f
  end

  def calc_position
    @x = @x.to_f + @vel_x * 25000
    @y = @y.to_f + @vel_y * 25000
    @scaled_x = (@x / @size) + 640
    @scaled_y = (-@y / @size) + 640
  end



end
