module EightyEighty::Instruction::Arithmetic::IncrementRegister
  MNEMONIC = "DCR"

  def self.run(state : State)
    result = state.destination_register += 1
    state.cc.set_from(result)
    state.cc.carry = result == 0
    state.pc += 1
    5
  end
end
