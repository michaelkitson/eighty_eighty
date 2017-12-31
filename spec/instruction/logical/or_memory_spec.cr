require "../../spec_helper"

describe EightyEighty::Instruction::Logical::OrMemory do
  it "ands to make zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xF]
    state.hl = 1_u16
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::OrMemory.run(state).should eq(7)
    state.a.should eq(0xFF)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.pc.should eq(1)
  end

  it "Ands zero" do
    state = EightyEighty::State.new
    state.memory = Bytes[0xCC]
    state.hl = 0_u16
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::OrMemory.run(state).should eq(7)
    state.a.should eq(0xFC)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_false
    state.pc.should eq(1)
  end
end
