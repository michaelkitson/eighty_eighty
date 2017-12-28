require "../../spec_helper"

describe EightyEighty::Instruction::Logical::RotateLeft do
  it "handles a carry" do
    state = EightyEighty::State.new
    state.a = 0b10101010_u8
    EightyEighty::Instruction::Logical::RotateLeft.run(state)
    state.a.should eq(0b01010101)
    state.cc.carry.should be_true
    state.pc.should eq(1)
  end

  it "handles a non-carry" do
    state = EightyEighty::State.new
    state.a = 0b01010101_u8
    EightyEighty::Instruction::Logical::RotateLeft.run(state)
    state.a.should eq(0b10101010)
    state.cc.carry.should be_false
    state.pc.should eq(1)
  end
end
