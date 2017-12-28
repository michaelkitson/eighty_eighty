module EightyEighty::Instruction::DataTransfer::StoreAccumulatorIndirect
  MNEMONIC = "STAX"

  def self.run(state : State)
    case (state.read_instruction_op & 0b00110000_u8) >> 4
    when 0 then state.memory[state.bc] = state.a
    when 1 then state.memory[state.de] = state.a
    else        raise "Invalid Register Source"
    end
    state.pc += 1
  end
end
