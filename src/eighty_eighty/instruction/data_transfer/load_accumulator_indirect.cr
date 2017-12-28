module EightyEighty::Instruction::DataTransfer::LoadAccumulatorIndirect
  MNEMONIC = "LDAX"

  def self.run(state : State)
    state.a = case (state.read_instruction_op & 0b00110000_u8) >> 4
              when 0 then state.memory[state.bc]
              when 1 then state.memory[state.de]
              else        raise "Invalid Register Source"
              end
    state.pc += 1
  end
end
