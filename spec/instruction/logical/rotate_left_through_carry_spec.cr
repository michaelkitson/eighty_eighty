require "../../spec_helper"

describe EightyEighty::Instruction::Logical::RotateLeftThroughCarry do
  it "handles carries" do
    state = EightyEighty::State.new
    state.a = 0b10110000_u8
    EightyEighty::Instruction::Logical::RotateLeftThroughCarry.run(state).should eq(4)
    state.a.should eq(0b01100000)
    state.cc.carry.should be_true
    state.pc.should eq(1)
    EightyEighty::Instruction::Logical::RotateLeftThroughCarry.run(state).should eq(4)
    state.a.should eq(0b11000001)
    state.cc.carry.should be_false
    state.pc.should eq(2)
    EightyEighty::Instruction::Logical::RotateLeftThroughCarry.run(state).should eq(4)
    state.a.should eq(0b10000010)
    state.cc.carry.should be_true
    state.pc.should eq(3)
    EightyEighty::Instruction::Logical::RotateLeftThroughCarry.run(state).should eq(4)
    state.a.should eq(0b00000101)
    state.cc.carry.should be_true
    state.pc.should eq(4)
  end
end
