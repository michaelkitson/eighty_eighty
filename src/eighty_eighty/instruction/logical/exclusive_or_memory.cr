module EightyEighty::Instruction::Logical::ExclusiveOrMemory
  MNEMONIC = "XRA"

  def self.run(state : State)
    result = state.a ^= state.memory[state.hl]
    state.cc.set_from(result)
    state.cc.carry = false
    state.cc.auxiliary_carry = false
    state.pc += 1
    7
  end
end
