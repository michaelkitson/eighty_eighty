require "../../spec_helper"

describe EightyEighty::Instruction::Logical::ExclusiveOrImmediate do
  it "XORs to make zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xF0]
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::ExclusiveOrImmediate.run(state)
    state.a.should eq(0)
    state.cc.zero.should be_true
    state.cc.parity.should be_true
    state.pc.should eq(2)
  end

  it "XORs to non zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xCF]
    state.a = 0xFC_u8
    EightyEighty::Instruction::Logical::ExclusiveOrImmediate.run(state)
    state.a.should eq(0x33)
    state.cc.signed.should be_false
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_false
    state.pc.should eq(2)
  end
end
