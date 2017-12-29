module EightyEighty::Instruction::StackIOControl::Push
  MNEMONIC = "PUSH"

  def self.run(state : State)
    value = state.register_pair
    state.memory[state.sp - 1] = (value >> 8).to_u8
    state.memory[state.sp - 2] = value.to_u8
    state.sp -= 2
    state.pc += 1
    11
  end
end
