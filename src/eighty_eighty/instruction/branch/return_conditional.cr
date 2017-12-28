require "./return"

module EightyEighty::Instruction::Branch::ReturnConditional
  def self.run(state : State)
    if state.condition?
      Return.run(state)
    else
      state.pc += 1
    end
  end
end
