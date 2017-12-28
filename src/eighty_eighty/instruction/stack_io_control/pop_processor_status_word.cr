module EightyEighty::Instruction::StackIOControl::PopProcessorStatusWord
  MNEMONIC = "POP PSW"

  def self.run(state : State)
    state.cc.psw = state.memory[state.sp]
    state.a = state.memory[state.sp + 1]
    state.sp += 2
    state.pc += 1
  end
end
