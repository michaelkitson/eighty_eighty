require "../../spec_helper"

describe EightyEighty::Instruction::Logical::OrRegister do
  it "ands b" do
    state = EightyEighty::State.new
    state.memory = Bytes[0]
    state.b = 0xF_u8
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::OrRegister.run(state).should eq(4)
    state.a.should eq(0xFF)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.pc.should eq(1)
  end

  it "Ands c" do
    state = EightyEighty::State.new
    state.memory = Bytes[1]
    state.c = 0xCC_u8
    state.a = 0xF0_u8
    EightyEighty::Instruction::Logical::OrRegister.run(state).should eq(4)
    state.a.should eq(0xFC)
    state.cc.signed.should be_true
    state.cc.zero.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_false
    state.pc.should eq(1)
  end
end
