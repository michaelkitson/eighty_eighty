module EightyEighty::Instruction::Logical::RotateRight
  MNEMONIC = "RRC"

  def self.run(state : State)
    state.cc.carry = state.a.bit(0) > 0
    state.a >>= 1
    state.a |= 128 if state.cc.carry
    state.pc += 1
    4
  end
end
