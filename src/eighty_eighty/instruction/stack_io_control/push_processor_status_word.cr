module EightyEighty::Instruction::StackIOControl::PushProcessorStatusWord
  MNEMONIC = "PUSH PSW"

  def self.run(state : State)
    state.memory[state.sp - 1] = state.a
    state.memory[state.sp - 2] = state.cc.psw
    state.sp -= 2
    state.pc += 1
    11
  end
end
