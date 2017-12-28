module EightyEighty::Instruction::Branch::Return
  MNEMONIC = "RET"

  def self.run(state : State)
    state.pc = (state.memory[state.sp + 1].to_u16 << 8) + state.memory[state.sp]
    state.sp += 2
  end
end
