module EightyEighty::Instruction::Logical::AndRegister
  MNEMONIC = "ANA"

  def self.run(state : State)
    result = state.a &= state.source_register
    state.cc.set_from(result)
    state.cc.carry = false
    state.cc.auxiliary_carry = false
    state.pc += 1
    4
  end
end
