module EightyEighty::Instruction::Arithmetic::SubtractImmediateWithBorrow
  MNEMONIC = "SBI"

  def self.run(state : State)
    minuend = state.a
    subtrahend = state.read_instruction_u8 + (state.cc.carry ? 1 : 0)
    state.a = minuend - subtrahend
    state.cc.set_from(state.a)
    state.cc.carry = (subtrahend > minuend) || (state.cc.carry && subtrahend == 0)
    state.cc.auxiliary_carry = (subtrahend & 0xF) > (minuend & 0xF) || state.cc.carry 
    state.pc += 2
    7
  end
end
