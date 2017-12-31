require "../../spec_helper"

describe EightyEighty::Instruction::Logical::SetCarry do
  it "sets false to true" do
    state = EightyEighty::State.new
    EightyEighty::Instruction::Logical::SetCarry.run(state).should eq(4)
    state.cc.carry.should be_true
    state.pc.should eq(1)
  end

  it "keeps true as true" do
    state = EightyEighty::State.new
    state.cc.carry = true
    EightyEighty::Instruction::Logical::SetCarry.run(state).should eq(4)
    state.cc.carry.should be_true
    state.pc.should eq(1)
  end
end
