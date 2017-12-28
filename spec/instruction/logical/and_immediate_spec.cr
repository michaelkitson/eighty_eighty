require "../../spec_helper"

describe EightyEighty::Instruction::Logical::AndImmediate do
  it "ands to make zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xF]
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::AndImmediate.run(state)
    state.a.should eq(0)
    state.cc.zero.should be_true
    state.cc.parity.should be_true
    state.pc.should eq(2)
  end

  it "Ands non zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xCF]
    state.a = 0xFC_u8
    EightyEighty::Instruction::Logical::AndImmediate.run(state)
    state.a.should eq(0xCC)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_false
    state.pc.should eq(2)
  end
end
