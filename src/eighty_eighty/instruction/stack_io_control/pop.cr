module EightyEighty::Instruction::StackIOControl::Pop
  MNEMONIC = "POP"

  def self.run(state : State)
    state.register_pair = (state.memory[state.sp + 1].to_u16 << 8) + state.memory[state.sp]
    state.sp += 2
    state.pc += 1
    10
  end
end
