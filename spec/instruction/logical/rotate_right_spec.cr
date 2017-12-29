require "../../spec_helper"

describe EightyEighty::Instruction::Logical::RotateRight do
  it "handles a carry" do
    state = EightyEighty::State.new
    state.a = 0b00001011_u8
    EightyEighty::Instruction::Logical::RotateRight.run(state).should eq(4)
    state.a.should eq(0b10000101)
    state.cc.carry.should be_true
    state.pc.should eq(1)
  end

  it "handles a non-carry" do
    state = EightyEighty::State.new
    state.a = 0b00010110_u8
    EightyEighty::Instruction::Logical::RotateRight.run(state).should eq(4)
    state.a.should eq(0b00001011)
    state.cc.carry.should be_false
    state.pc.should eq(1)
  end
end
