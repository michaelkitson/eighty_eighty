require "./return"

module EightyEighty::Instruction::Branch::ReturnConditional
  def self.run(state : State)
    if state.condition?
      Return.run(state)
      11
    else
      state.pc += 1
      5
    end
  end
end
