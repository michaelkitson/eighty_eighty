require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::IncrementRegister do
  it "increments b" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0]
    state.b = 255_u8
    EightyEighty::Instruction::Arithmetic::IncrementRegister.run(state)
    state.b.should eq(0)
    state.pc.should eq(1)
    state.cc.zero.should be_true
    state.cc.signed.should be_false
    state.cc.carry.should be_true
    state.cc.parity.should be_true
  end

  it "increments c" do
    state = EightyEighty::State.new
    state.memory = Bytes[0b1000, 0]
    EightyEighty::Instruction::Arithmetic::IncrementRegister.run(state)
    state.c.should eq(1)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_false
  end
end
