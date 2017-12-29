module EightyEighty::Instruction::DataTransfer::LoadRegisterPairImmediate
  MNEMONIC = "LXI"
    
  def self.run(state : State)
    u16 = state.read_instruction_u16
    u8s = [state.read_instruction_high_u8, state.read_instruction_low_u8]
    case (state.read_instruction_op & 0b00110000_u8) >> 4
    when 0 then state.b, state.c = u8s
    when 1 then state.d, state.e = u8s
    when 2 then state.h, state.l = u8s
    when 3 then state.sp = u16
    end
    state.pc += 3
    10
  end
end
