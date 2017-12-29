module EightyEighty::Instruction::StackIOControl::EnableInterrupts
  MNEMONIC = "EI"

  def self.run(state : State)
    state.interrupts_enabled = true
    state.pc += 1
    4
  end
end
