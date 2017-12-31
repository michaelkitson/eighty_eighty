module EightyEighty::Instruction::Branch::JumpHLIndirect
    MNEMONIC = "PCHL"
  
    def self.run(state : State)
      state.pc = state.hl
      5
    end
  end
  