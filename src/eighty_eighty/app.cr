require "./window"

module EightyEighty
  CLOCK_HZ = 2_000_000
  INTERRUPT_HZ = 60
  CYCLES_PER_INTERRUPT = CLOCK_HZ / INTERRUPT_HZ
  INTERRUPT_PERIOD = 1.second / INTERRUPT_HZ

  class App
    @next_interrupt : Time::Span

    def initialize(@rom_filename : String)
      rom_file = File.open(@rom_filename)
      state = State.new
      bytes_read = rom_file.read(state.memory)
      puts "Read #{bytes_read} bytes"

      @window = Window.new(224, 256)
      @emulator = Emulator.new(state)

      shift_offset = 0_u8
      shift = 0_u16
      shift0 = 0_u8
      shift1 = 0_u8
      @emulator.input_handler = ->(port : UInt8) {
        case port
        when 0
          1_u8
        when 3
          v = (shift1.to_u16 << 8) | shift0
          (v >> (8 - shift_offset)).to_u8 & 0xff_u8
        else
          0_u8
        end
      }
      @emulator.output_handler = ->(port : UInt8, val : UInt8) {
        case port
        when 2
          shift_offset = val & 0x7
        when 4
          shift0 = shift1
          shift1 = val
        end
        nil
      }
      # @last_interrupt = Time.monotonic
      @next_interrupt = Time.monotonic + INTERRUPT_PERIOD
    end

    def run
      loop do
        run_and_interrupt(1_u8)
        run_and_interrupt(2_u8)
        redraw
      end
    end

    def run_and_interrupt(interrupt_number)
      sleep_if_necessary
      @next_interrupt += INTERRUPT_PERIOD
      cycles = 0
      until cycles > CYCLES_PER_INTERRUPT
        cycles += @emulator.execute_operation
      end
      @emulator.generate_interrupt(interrupt_number)
    end

    def redraw
      (224 * 256/8).times do |byte_i|
        byte = @emulator.state.memory[0x2400 + byte_i]
        pixel = byte_i * 8
        8.times do |bit_i|
          val = byte.bit(bit_i) > 0 ? 255_u8 : 0_u8
          column = (pixel + bit_i) / 256
          row = (pixel + bit_i) % 256
          index = 3 * (256 * row + column)
          @window.framebuffer[index + 0] = val
          @window.framebuffer[index + 1] = val
          @window.framebuffer[index + 2] = val
        end
      end
      @window.redraw
  end

    def sleep_if_necessary
      now = Time.monotonic
      if now > @next_interrupt
        # puts "Yikes, out of time"
        return
      end
      # puts "Sleeping: #{@next_interrupt - now}"
      sleep(@next_interrupt - now)
    end
  end
end
