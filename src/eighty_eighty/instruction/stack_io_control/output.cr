module EightyEighty::Instruction::StackIOControl::Output
    MNEMONIC = "OUT"
  
    def self.run(state : State)
      state.pc += 2
      10
    end
  end