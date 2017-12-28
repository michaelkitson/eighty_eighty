module EightyEighty::Instruction::StackIOControl::DisableInterrupts
  MNEMONIC = "DI"

  def self.run(state : State)
    state.interrupts_enabled = false
    state.pc += 1
  end
end
