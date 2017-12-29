require "./jump"

module EightyEighty::Instruction::Branch::JumpConditional
  def self.run(state : State)
    if state.condition?
      Jump.run(state)
    else
      state.pc += 3
      10
    end
  end
end
