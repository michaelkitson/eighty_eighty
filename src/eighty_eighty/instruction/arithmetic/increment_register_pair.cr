module EightyEighty::Instruction::Arithmetic::IncrementRegisterPair
  MNEMONIC = "INX"

  def self.run(state : State)
    result = state.register_pair += 1
    state.cc.set_from(result)
    state.cc.carry = result == 0
    state.pc += 1
    5
  end
end
