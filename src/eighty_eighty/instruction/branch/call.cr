module EightyEighty::Instruction::Branch::Call
    MNEMONIC = "CALL"
    
    def self.run(state : State)
      new_pc = state.read_instruction_u16
      state.pc += 3
      state.memory[state.sp - 1] = (state.pc >> 8).to_u8
      state.memory[state.sp - 2] = state.pc.to_u8
      state.sp -= 2
      state.pc = new_pc
      17
    end
  end
  