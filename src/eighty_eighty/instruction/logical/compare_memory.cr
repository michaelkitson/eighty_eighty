module EightyEighty::Instruction::Logical::CompareMemory
    MNEMONIC = "CMP"
  
    def self.run(state : State)
      val = state.memory[state.hl]
      state.cc.set_from(state.a - val)
      state.cc.carry = state.a < val
      state.cc.auxiliary_carry = (state.a & 0xF) < (val & 0xF)
      state.pc += 1
      7
    end
  end
  