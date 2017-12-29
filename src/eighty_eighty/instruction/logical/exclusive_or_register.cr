module EightyEighty::Instruction::Logical::ExclusiveOrRegister
  MNEMONIC = "XRA"

  def self.run(state : State)
    result = state.a ^= state.source_register
    state.cc.set_from(result)
    state.cc.carry = false
    state.cc.auxiliary_carry = false
    state.pc += 1
    4
  end
end
