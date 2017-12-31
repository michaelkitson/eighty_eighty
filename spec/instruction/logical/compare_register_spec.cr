require "../../spec_helper"

describe EightyEighty::Instruction::Logical::CompareRegister do
  it "Handles equal arguments" do
    state = EightyEighty::State.new
    state.memory = Bytes[0]
    state.a = 1_u8
    state.b = 1_u8
    EightyEighty::Instruction::Logical::CompareRegister.run(state).should eq(4)
    state.a.should eq(1)
    state.b.should eq(1)
    state.pc.should eq(1)
    state.cc.zero.should be_true
    state.cc.carry.should be_false
    state.cc.parity.should be_true
    state.cc.signed.should be_false
    state.cc.auxiliary_carry.should be_false
  end

  it "Handles a negative difference" do
    state = EightyEighty::State.new
    state.memory = Bytes[1]
    state.a = 1_u8
    state.c = 2_u8
    EightyEighty::Instruction::Logical::CompareRegister.run(state).should eq(4)
    state.a.should eq(1)
    state.c.should eq(2)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.carry.should be_true
    state.cc.parity.should be_true
    state.cc.signed.should be_true
    state.cc.auxiliary_carry.should be_true
  end

  it "Handles a positive difference" do
    state = EightyEighty::State.new
    state.memory = Bytes[2]
    state.a = 2_u8
    state.d = 1_u8
    EightyEighty::Instruction::Logical::CompareRegister.run(state).should eq(4)
    state.a.should eq(2)
    state.d.should eq(1)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
    state.cc.signed.should be_false
    state.cc.auxiliary_carry.should be_false
  end
end
