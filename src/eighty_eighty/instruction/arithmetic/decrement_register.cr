module EightyEighty::Instruction::Arithmetic::DecrementRegister
  MNEMONIC = "DCR"

  def self.run(state : State)
    result = state.destination_register -= 1
    state.cc.set_from(result)
    state.cc.carry = result == 0xFF
    state.pc += 1
  end
end