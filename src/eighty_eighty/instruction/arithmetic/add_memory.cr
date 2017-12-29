module EightyEighty::Instruction::Arithmetic::AddMemory
  MNEMONIC = "ADD"

  def self.run(state : State)
    initial = state.a
    result = state.a += state.memory[state.hl]
    state.cc.set_from(result)
    state.cc.carry = result < initial
    state.cc.auxiliary_carry = (result & 0xF) < (initial & 0xF)
    state.pc += 1
    7
  end
end
