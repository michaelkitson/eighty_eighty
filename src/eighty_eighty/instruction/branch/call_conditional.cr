require "./call"

module EightyEighty::Instruction::Branch::CallConditional
  def self.run(state : State)
    if state.condition?
      Call.run(state)
    else
      state.pc += 3
    end
  end
end
