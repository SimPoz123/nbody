require "gosu"
require_relative "z_order"
require './body'

class NbodySimulation < Gosu::Window

  attr_accessor :bodies, :background_image

  def initialize(file)
    super(640, 640, false)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)

    simulation = open(file)
    list = simulation.read
    list = list.split(/\n/)
    size = list[1]
    size = size.split('e')
    size = size[0].to_i * (10 ** size[1].to_i)
    unit = 640 / size.to_f
    puts size
    puts unit

    @bodies = Array.new

    list.each do |line|
      line = line.split
      if line.length > 4
        line.each do |x|
          x = x.to_f
        end
        # puts line[5]
        @bodies.push(Body.new(line[0], line[1], line[2], line[3], line[4], line[5]))
      end
    end
  end

  def update
    bodies.each do |body|
      body.calculate_force(bodies)
      body.calculate_position
    end
  end

  def draw
    background_image.draw(0, 0, ZOrder::Background)
    @bodies.each do |body|
      body.draw
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

end

if ARGV.length == 0
  file = "simulations/planets.txt"
else
  file = "simulations" + ARGV
end

window = NbodySimulation.new(file)
window.show
