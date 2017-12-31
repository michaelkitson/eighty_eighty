module EightyEighty::Instruction::StackIOControl::ExchangeStackTopWithHL
  MNEMONIC = "XTHL"

  def self.run(state : State)
    temp_l = state.l
    temp_h = state.h
    state.l = state.memory[state.sp]
    state.h = state.memory[state.sp + 1]
    state.memory[state.sp] = temp_l
    state.memory[state.sp + 1] = temp_h
    state.pc += 1
    18
  end
end
