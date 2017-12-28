require "gl"
require "lib_gl"
require "crystglfw"

class Window
  def initialize(@width : Int32, @height : Int32, @title = "")
    @delta_time = 0.0
    @last_frame = 0.0

    CrystGLFW.run do
      # Create a new window.
      window = CrystGLFW::Window.new(title: "EightyEighty", height: @height, width: @width)

      # Configure the window to print its dimensions each time it is resized.
      window.on_resize do |event|
        puts "Window resized to #{event.size}"
      end

      # Make this window's OpenGL context the current drawing context.
      window.make_context_current

      #   LibGL.gen_textures(1, out texture_id)
      # glGenTextures(1,&rect_tex);
      #   LibGL.bind_texture(LibGL::TEXTURE_2D, texture_id)
      # glBindTexture(GL_TEXTURE_RECTANGLE_NV,rect_tex);
      #   LibGL.tex_image_2d(LibGL::TEXTURE_2D, 0, LibGL::RGBA8, @height, @width, 0, LibGL::RGBA, LibGL::UNSIGNED_BYTE, nil)
      #   LibGL.tex_parameter_i(LibGL::TEXTURE_2D, LibGL::TEXTURE_MIN_FILTER, LibGL::LINEAR)
      #   LibGL.tex_parameter_i(LibGL::TEXTURE_2D, LibGL::TEXTURE_MAG_FILTER, LibGL::LINEAR)
      #   LibGL.enable(LibGL::TEXTURE_2D)
      #   LibGL.bind_texture(LibGL::TEXTURE_2D, 0)
      # glTexImage2D(GL_TEXTURE_RECTANGLE_NV,0,GL_RGB8,xres,yres,0,GL_RGBA,GL_UNSIGNED_BYTE,NULL);
      # glTexParameteri(GL_TEXTURE_RECTANGLE_NV,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
      # glTexParameteri(GL_TEXTURE_RECTANGLE_NV,GL_TEXTURE_MAG_FILTER,GL_NEAREST);

      #   LibGL.tex_image_2d(LibGL::TEXTURE_2D, 0, LibGL::RGBA8, @height, @width, 0, LibGL::RGB, LibGL::UNSIGNED_BYTE, nil)
      #   LibGL.tex_parameter_i(LibGL::TEXTURE_2D, LibGL::TEXTURE_MIN_FILTER, LibGL::NEAREST)
      #   LibGL.tex_parameter_i(LibGL::TEXTURE_2D, LibGL::TEXTURE_MAG_FILTER, LibGL::NEAREST)
      #   LibGL.tex_parameter_i(LibGL::TEXTURE_2D, LibGL::TEXTURE_WRAP_S, LibGL::CLAMP)
      #   LibGL.tex_parameter_i(LibGL::TEXTURE_2D, LibGL::TEXTURE_WRAP_T, LibGL::CLAMP)
      #   LibGL.enable(LibGL::TEXTURE_2D)

      data = [] of UInt8
      @height.times do |h|
        @width.times do |w|
          data << 255_u8
          data << 0_u8
          data << 0_u8
        end
      end

      GL.tex_image2_d(GL::TEXTURE_2D, 0, GL::RGB8, @height * 2, @width * 2, 0, GL::RGB, GL::UNSIGNED_BYTE, data)
      GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_MIN_FILTER, GL::NEAREST)
      GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_MAG_FILTER, GL::NEAREST)
      GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_WRAP_S, GL::CLAMP)
      GL.tex_parameteri(GL::TEXTURE_2D, GL::TEXTURE_WRAP_T, GL::CLAMP)
      GL.enable(GL::TEXTURE_2D)

      # Listen for callbacks and draw the window until it has been marked for closing.
      until window.should_close?
        CrystGLFW.poll_events

        # time_value = CrystGLFW.time
        # red_value = Math.sin(time_value).abs
        # green_value = Math.cos(time_value).abs
        # blue_value = Math.tan(time_value).abs

        # Clear the window with the generated color.
        # LibGL.clear_color(red_value, green_value, blue_value, 1.0)
        # LibGL.clear(LibGL::COLOR_BUFFER_BIT)
        # @height.times do |h|
        #     @width.times do |w|
        #     data[3 * (@width * h + w) + 0] = 1_u8
        #     data[3 * (@width * h + w) + 1] = 12_u8
        #     data[3 * (@width * h + w) + 2] = 128_u8
        #   end
        # end
        data = Random.new.random_bytes(3 * @width * @height)
        GL.tex_sub_image2_d(GL::TEXTURE_2D, 0, 0, 0, @width, @height, GL::RGB, GL::UNSIGNED_BYTE, data)
        GL.begin_(GL::QUADS)
        GL.tex_coord2d(0.0, 0.0); GL.vertex2d(-1.0, -1.0)
        GL.tex_coord2d(1.0, 0.0); GL.vertex2d(@width, -1.0)
        GL.tex_coord2d(1.0, 1.0); GL.vertex2d(@width, @height)
        GL.tex_coord2d(0.0, 1.0); GL.vertex2d(-1.0, @height)
        GL.end_
        # LibGL.bind_texture(LibGL::TEXTURE_2D, texture_id)
        # LibGL.tex_sub_image_2d(LibGL::TEXTURE_2D, 0, 0, 0, 256, 224, LibGL::RGBA, LibGL::UNSIGNED_BYTE, data);
        # LibGL.tex_image_2d(LibGL::TEXTURE_2D, 0, LibGL::RGBA8, 256, 224, 0, LibGL::RGBA, LibGL::UNSIGNED_BYTE, data)
        # LibGL.bind_texture(LibGL::TEXTURE_2D, 0)
        # LibGL.tex_image_2d(self, level_of_detail, internal_format, width, height, 0, format, data_type, data)
        # GL.draw_pixels(@width, @height, GL::RGBA, GL::UNSIGNED_BYTE, data)
        window.swap_buffers
      end

      # Destroy the window.
      window.destroy

      # Shut down and clean up GLFW.
    end
  end
end
