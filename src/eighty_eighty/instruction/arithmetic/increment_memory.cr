module EightyEighty::Instruction::Arithmetic::IncrementMemory
  MNEMONIC = "INR"

  def self.run(state : State)
    result = state.memory[state.hl] += 1
    state.cc.set_from(result)
    state.cc.carry = result == 0
    state.pc += 1
    10
  end
end
