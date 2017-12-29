module EightyEighty::Instruction::Arithmetic::AddRegister
  MNEMONIC = "ADD"

  def self.run(state : State)
    initial = state.a
    result = state.a += state.source_register
    state.cc.set_from(result)
    state.cc.carry = result < initial
    state.cc.auxiliary_carry = (result & 0xF) < (initial & 0xF)
    state.pc += 1
    4
  end
end
