module EightyEighty::Instruction::Arithmetic::SubtractRegisterWithBorrow
  MNEMONIC = "SBB"

  def self.run(state : State)
    minuend = state.a
    subtrahend = state.source_register + (state.cc.carry ? 1 : 0)
    state.a = minuend - subtrahend
    state.cc.set_from(state.a)
    state.cc.carry = (subtrahend > minuend) || (state.cc.carry && subtrahend == 0)
    state.cc.auxiliary_carry = (subtrahend & 0xF) > (minuend & 0xF) || state.cc.carry 
    state.pc += 1
    4
  end
end
