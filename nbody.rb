require "gosu"
require_relative "z_order"
require './body'

class NbodySimulation < Gosu::Window

  attr_accessor :bodies, :background_image, :size

  def initialize(file, size, full)
    super(size, size, full)
    self.caption = "NBody simulation"
    @background_image = Gosu::Image.new("images/space.jpg", tileable: true)

    simulation = open(file)
    list = simulation.read
    list = list.split(/\n/)
    num_bodies = list[0].to_i + 2
    radius = list[1].to_f / size

    @bodies = Array.new

    for i in 2...num_bodies
      line = list[i]
      line = line.split
      if line.length > 4
        line.each do |x|
          x = x.to_f
        end
        @bodies.push(Body.new(line[0], line[1], line[2], line[3], line[4], line[5], radius))
      end
    end
  end

  def update
    bodies.each do |body|

      bodies.each do |other_body|
        if body != other_body
          body.calculate_force(other_body)
        end
      end


      body.calc_acc
      body.calc_velocity
      body.calc_position
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
  sim = ARGV[0].to_s + ".txt"
  puts sim
  file = "simulations/" + sim
  puts file
end

window = NbodySimulation.new(file, 640, false)
window.show
