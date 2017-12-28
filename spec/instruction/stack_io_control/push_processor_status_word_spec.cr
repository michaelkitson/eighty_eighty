require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::PushProcessorStatusWord do
  it "pushes correctly" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 10_u16
    state.a = 1_u8
    state.cc.zero = true
    state.cc.carry = true
    EightyEighty::Instruction::StackIOControl::PushProcessorStatusWord.run(state)
    state.a.should eq(1)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.memory[9].should eq(1)
    state.memory[8].should eq(67)
  end
end
