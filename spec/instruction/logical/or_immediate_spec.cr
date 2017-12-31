require "../../spec_helper"

describe EightyEighty::Instruction::Logical::OrImmediate do
  it "ors non-overlapping" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xF]
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::OrImmediate.run(state).should eq(7)
    state.a.should eq(0xFF)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.pc.should eq(2)
  end

  it "ors overlapping" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xCC]
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::OrImmediate.run(state).should eq(7)
    state.a.should eq(0xFC)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_false
    state.pc.should eq(2)
  end
end
