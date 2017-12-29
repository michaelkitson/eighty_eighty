module EightyEighty::Instruction::Logical::RotateLeft
  MNEMONIC = "RLC"

  def self.run(state : State)
    state.cc.carry = state.a.bit(7) > 0
    state.a <<= 1
    state.a |= 1 if state.cc.carry
    state.pc += 1
    4
  end
end
