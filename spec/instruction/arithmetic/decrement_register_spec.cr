require "../../spec_helper"

base_op = 0b00000101_u8

describe EightyEighty::Instruction::Arithmetic::DecrementRegister do
  it "decrements b" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op]
    state.b = 255_u8
    EightyEighty::Instruction::Arithmetic::DecrementRegister.run(state).should eq(5)
    state.b.should eq(254)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_true
    state.cc.carry.should be_false
    state.cc.parity.should be_false
  end

  it "decrements c" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | 0b1000]
    EightyEighty::Instruction::Arithmetic::DecrementRegister.run(state).should eq(5)
    state.c.should eq(255)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_true
    state.cc.carry.should be_true
    state.cc.parity.should be_true
  end
end
