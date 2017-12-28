require "../../spec_helper"

describe EightyEighty::Instruction::Logical::ExclusiveOrMemory do
  it "XORs to make zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xF0]

    state.hl = 1_u16
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::ExclusiveOrMemory.run(state)
    state.a.should eq(0)
    state.cc.zero.should be_true
    state.cc.parity.should be_true
    state.pc.should eq(1)
  end

  it "XORs to non zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0]
    state.hl = 0_u16
    state.a = 0xFC_u8
    EightyEighty::Instruction::Logical::ExclusiveOrMemory.run(state)
    state.a.should eq(0xFC)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_false
    state.pc.should eq(1)
  end
end
