require "../../spec_helper"

describe EightyEighty::Instruction::Logical::CompareMemory do
  it "Handles equal arguments" do
    state = EightyEighty::State.new
    state.memory = Bytes[1]
    state.a = 1_u8
    EightyEighty::Instruction::Logical::CompareMemory.run(state).should eq(7)
    state.a.should eq(1)
    state.pc.should eq(1)
    state.cc.zero.should be_true
    state.cc.carry.should be_false
    state.cc.parity.should be_true
    state.cc.signed.should be_false
    state.cc.auxiliary_carry.should be_false
  end
end
