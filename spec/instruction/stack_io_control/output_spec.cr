require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::Output do
  it "increments pc" do
    state = EightyEighty::State.new
    EightyEighty::Instruction::StackIOControl::Output.run(state)
    state.pc.should eq(2)
  end
end
