require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::IncrementRegisterPair do
  it "increments bc" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00000011]
    state.bc = 255_u16
    EightyEighty::Instruction::Arithmetic::IncrementRegisterPair.run(state)
    state.bc.should eq(256)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
  end

  it "increments de" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00010011]
    EightyEighty::Instruction::Arithmetic::IncrementRegisterPair.run(state)
    state.de.should eq(1)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
  end

  it "increments hl" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00100011]
    state.hl = 0_u16 - 1_u16
    EightyEighty::Instruction::Arithmetic::IncrementRegisterPair.run(state)
    state.hl.should eq(0)
    state.pc.should eq(1)
    state.cc.zero.should be_true
    state.cc.signed.should be_false
    state.cc.carry.should be_true
    state.cc.parity.should be_true
  end

  it "increments sp" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00110011]
    state.sp = 1_u16
    EightyEighty::Instruction::Arithmetic::IncrementRegisterPair.run(state)
    state.sp.should eq(2)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
  end
end
