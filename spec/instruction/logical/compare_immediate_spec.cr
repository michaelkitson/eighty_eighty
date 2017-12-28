require "../../spec_helper"

describe EightyEighty::Instruction::Logical::CompareImmediate do
  it "Handles equal arguments" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 1]
    state.a = 1_u8
    EightyEighty::Instruction::Logical::CompareImmediate.run(state)
    state.a.should eq(1)
    state.pc.should eq(2)
    state.cc.zero.should be_true
    state.cc.carry.should be_false
    state.cc.parity.should be_true
    state.cc.signed.should be_false
    state.cc.auxiliary_carry.should be_false
  end

  it "Handles a negative difference" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 2]
    state.a = 1_u8
    EightyEighty::Instruction::Logical::CompareImmediate.run(state)
    state.a.should eq(1)
    state.pc.should eq(2)
    state.cc.zero.should be_false
    state.cc.carry.should be_true
    state.cc.parity.should be_true
    state.cc.signed.should be_true
    state.cc.auxiliary_carry.should be_true
  end

  it "Handles a positive difference" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 1]
    state.a = 2_u8
    EightyEighty::Instruction::Logical::CompareImmediate.run(state)
    state.a.should eq(2)
    state.pc.should eq(2)
    state.cc.zero.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
    state.cc.signed.should be_false
    state.cc.auxiliary_carry.should be_false
  end
end
