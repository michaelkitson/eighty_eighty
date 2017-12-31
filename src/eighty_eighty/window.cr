require "gl"
require "lib_gl"
require "crystglfw"

class EightyEighty::Window
  TEXTURE_WIDTH = 256
  TEXTURE_HEIGHT = 256

  property framebuffer = [] of UInt8

  def initialize(@width : Int32, @height : Int32, @title = "")
    @delta_time = 0.0
    @last_frame = 0.0

    LibGLFW.init
    # Create a new window.
    @window = CrystGLFW::Window.new(title: "EightyEighty", height: @height, width: @width)
    @window.set_size_limits(min_width: @width, min_height: @height)

    # Configure the window to print its dimensions each time it is resized.
    @window.on_resize do |event|
      puts "Window resized to #{event.size}"
    end

    # Make this window's OpenGL context the current drawing context.
    @window.make_context_current

    TEXTURE_HEIGHT.times do |h|
      TEXTURE_WIDTH.times do |w|
        @framebuffer << 0_u8
        @framebuffer << 0_u8
        @framebuffer << 0_u8
      end
    end

    GL.tex_image2_d(GL::TEXTURE_2D, 0, GL::RGB8, TEXTURE_HEIGHT, TEXTURE_WIDTH, 0, GL::RGB, GL::UNSIGNED_BYTE, @framebuffer); raise_gl_errors
    GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER, GL::NEAREST); raise_gl_errors
    GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER, GL::NEAREST); raise_gl_errors
    GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_WRAP_S, GL::CLAMP); raise_gl_errors
    GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_WRAP_T, GL::CLAMP); raise_gl_errors
    GL.enable(GL::TEXTURE_2D); raise_gl_errors
  end

  def finalize
    LibGLFW.terminate
  end

  def redraw
    raise "should close" if @window.should_close?
    CrystGLFW.poll_events

    GL.tex_sub_image2_d(GL::TEXTURE_2D, 0, 0, 0, TEXTURE_HEIGHT, TEXTURE_WIDTH, GL::RGB, GL::UNSIGNED_BYTE, @framebuffer); raise_gl_errors

    GL.begin_(GL::QUADS)
    GL.tex_coord2d(0.0, 0.0); GL.vertex2d(-1.0, -1.0)
    GL.tex_coord2d(0.875, 0.0); GL.vertex2d(1.0, -1.0)
    GL.tex_coord2d(0.875, 1.0); GL.vertex2d(1.0, 1.0)
    GL.tex_coord2d(0.0, 1.0); GL.vertex2d(-1.0, 1.0)
    GL.end_; raise_gl_errors

    @window.swap_buffers
  end

  private def raise_gl_errors
    error_code = GL.get_error
    raise "OpenGL Error: #{error_code.to_s}" if error_code > 0
  end
end
