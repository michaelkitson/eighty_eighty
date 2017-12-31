module EightyEighty::Instruction::Logical::RotateLeftThroughCarry
  MNEMONIC = "RAL"

  def self.run(state : State)
    was_carry = state.cc.carry
    state.cc.carry = state.a.bit(7) > 0
    state.a <<= 1
    state.a |= 1 if was_carry
    state.pc += 1
    4
  end
end
