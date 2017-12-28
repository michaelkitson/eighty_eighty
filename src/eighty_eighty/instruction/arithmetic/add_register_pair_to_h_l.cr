module EightyEighty::Instruction::Arithmetic::AddRegisterPairToHL
  MNEMONIC = "DAD"

  def self.run(state : State)
    initial = state.hl
    result = state.hl += state.register_pair
    state.cc.carry = result < initial
    state.pc += 1
  end
end
