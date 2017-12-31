module EightyEighty::Instruction::Logical::RotateRightThroughCarry
  MNEMONIC = "RAR"

  def self.run(state : State)
    was_carry = state.cc.carry
    state.cc.carry = state.a.bit(0) > 0
    state.a >>= 1
    state.a |= 128 if was_carry
    state.pc += 1
    4
  end
end
