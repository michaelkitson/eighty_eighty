module EightyEighty::Instruction::Branch::Jump
  MNEMONIC = "JMP"

  def self.run(state : State)
    state.pc = state.read_instruction_u16
  end
end
