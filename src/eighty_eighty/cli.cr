require "option_parser"

require "./app"
require "./emulator"
require "./state"

module EightyEighty
  class Cli
    @disassemble : Bool
    @start_address : UInt16
    @filename : String

    def initialize
      @disassemble = false
      @start_address = 0x00_u16
      @filename = ""
      parse_arguments
    end

    def run
      App.new(@filename).run
    end

    private def parse_arguments
      OptionParser.parse! do |parser|
        parser.banner = "Usage: eightyeighty [options] <rom>"
        # parser.on("-d", "--disassemble", "Print the disassembly of the rom file") { @disassemble = true }
        # parser.on("-a", "--start-address", "Start executing from the given hex address. default: 0") { |address| @start_address = address.to_u16 }
        parser.on("-h", "--help", "Show this help") { puts parser; exit(0) }
        parser.unknown_args do |files|
          if files.first?.nil?
            puts parser
            exit(1)
          end
            @filename = files.first
        end
      end
    end
  end
end
