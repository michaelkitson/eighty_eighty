module EightyEighty::Instruction::Logical::SetCarry
    MNEMONIC = "STC"
  
    def self.run(state : State)
      state.cc.carry = true
      state.pc += 1
      4
    end
  end
  