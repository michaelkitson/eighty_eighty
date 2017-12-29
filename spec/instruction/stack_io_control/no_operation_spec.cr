require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::NoOperation do
  it "increments pc" do
    state = EightyEighty::State.new
    EightyEighty::Instruction::StackIOControl::NoOperation.run(state).should eq(4)
    state.pc.should eq(1)
  end
end
