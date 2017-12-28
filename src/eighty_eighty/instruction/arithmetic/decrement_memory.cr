module EightyEighty::Instruction::Arithmetic::DecrementMemory
  MNEMONIC = "DCR"

  def self.run(state : State)
    state.memory[state.hl] -= 1
    result = state.memory[state.hl]
    state.cc.set_from(result)
    state.cc.carry = result == 0xFF
    state.pc += 1
  end
end
