module EightyEighty::Instruction::Arithmetic::AddImmediate
  MNEMONIC = "ADI"

  def self.run(state : State)
    initial = state.a
    result = state.a += state.read_instruction_u8
    state.cc.set_from(result)
    state.cc.carry = result < initial
    state.cc.auxiliary_carry = (result & 0xF) < (initial & 0xF)
    state.pc += 2
  end
end
