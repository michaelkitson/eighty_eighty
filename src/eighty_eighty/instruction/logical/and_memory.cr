module EightyEighty::Instruction::Logical::AndMemory
  MNEMONIC = "ANA"

  def self.run(state : State)
    result = state.a &= state.memory[state.hl]
    state.cc.set_from(result)
    state.cc.carry = false
    state.cc.auxiliary_carry = false
    state.pc += 1
  end
end
