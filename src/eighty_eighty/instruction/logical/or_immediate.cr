module EightyEighty::Instruction::Logical::OrImmediate
  MNEMONIC = "ORI"

  def self.run(state : State)
    result = state.a |= state.read_instruction_u8
    state.cc.set_from(result)
    state.cc.carry = false
    state.cc.auxiliary_carry = false
    state.pc += 2
    7
  end
end
