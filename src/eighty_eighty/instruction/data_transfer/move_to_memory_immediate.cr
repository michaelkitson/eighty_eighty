module EightyEighty::Instruction::DataTransfer::MoveToMemoryImmediate
  MNEMONIC = "MOV"

  def self.run(state : State)
    state.memory[state.hl] = state.read_instruction_u8
    state.pc += 2
  end
end
