require "../../spec_helper"

describe EightyEighty::Instruction::Logical::ComplementAccumulator do
  it "ands to make zero" do
    state = EightyEighty::State.new
    state.a = 0b01010011_u8
    EightyEighty::Instruction::Logical::ComplementAccumulator.run(state).should eq(4)
    state.a.should eq(0b10101100)
    state.pc.should eq(1)
  end
end