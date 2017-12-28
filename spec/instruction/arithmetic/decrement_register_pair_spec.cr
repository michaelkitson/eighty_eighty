require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::DecrementRegisterPair do
  it "decrements bc" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00001011]
    state.bc = 256_u16
    EightyEighty::Instruction::Arithmetic::DecrementRegisterPair.run(state)
    state.bc.should eq(255)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_true
  end

  it "decrements de" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00011011]
    EightyEighty::Instruction::Arithmetic::DecrementRegisterPair.run(state)
    state.de.should eq(65535)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_true
    state.cc.carry.should be_true
    state.cc.parity.should be_true
  end

  it "decrements hl" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00101011]
    state.hl = 1_u16
    EightyEighty::Instruction::Arithmetic::DecrementRegisterPair.run(state)
    state.hl.should eq(0)
    state.pc.should eq(1)
    state.cc.zero.should be_true
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_true
  end

  it "decrements sp" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b00111011]
    state.sp = 2_u16
    EightyEighty::Instruction::Arithmetic::DecrementRegisterPair.run(state)
    state.sp.should eq(1)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
  end
end
