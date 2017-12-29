module EightyEighty::Instruction::Logical::CompareImmediate
  MNEMONIC = "CPI"

  def self.run(state : State)
    imm = state.read_instruction_u8
    state.cc.set_from(state.a - imm)
    state.cc.carry = state.a < imm
    state.cc.auxiliary_carry = (state.a & 0xF) < (imm & 0xF)
    state.pc += 2
    7
  end
end
