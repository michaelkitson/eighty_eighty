module EightyEighty::Instruction::StackIOControl::NoOperation
  MNEMONIC = "NOP"

  def self.run(state : State)
    state.pc += 1
    4
  end
end