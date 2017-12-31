module EightyEighty::Instruction::Logical::ComplementAccumulator
    MNEMONIC = "CMA"
  
    def self.run(state : State)
      state.a ^= 0xFF
      state.pc += 1
      4
    end
  end
  