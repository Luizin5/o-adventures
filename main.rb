require 'curses'

class App
  #include Curses

  def initialize
    Curses.init_screen
    Curses.cbreak
    Curses.noecho
    Curses.curs_set 0
    begin
      @x = 5
      @y = 5
      @a = 0

      Curses.setpos(@x,@y)
      Curses.addstr("o")
      
      loop do
        k = Curses.getch

        case k
        when "a" then mover("left")
        when "d" then mover("right")
        when "w" then mover("up")
        when "s" then mover("down")
        end

      end
    #ensure
    #  close_screen
    end
  end

  def mover(direcao)
    Curses.clear
    Curses.refresh
    keypressed(direcao)
    Curses.setpos(@x,@y)
    Curses.addstr("o")
    Curses.refresh
  end

  def keypressed(dir)
    case dir
      when "down"
        @x +=1
      when "up"
        @x -=1
      when "right"
        @y +=1
      when "left"
        @y -=1
    end
  end
end

App.new
