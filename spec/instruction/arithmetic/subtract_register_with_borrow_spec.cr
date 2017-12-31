require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::SubtractRegisterWithBorrow do
  it "subtracts b" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0]
    state.a = 65_u8
    state.b = 255_u8
    state.cc.carry = true
    EightyEighty::Instruction::Arithmetic::SubtractRegisterWithBorrow.run(state).should eq(4)
    state.a.should eq(65)
    state.b.should eq(255)
    state.pc.should eq(1)
    state.cc.carry.should be_true
    state.cc.auxiliary_carry.should be_true
  end

  it "subtracts c" do
    state = EightyEighty::State.new
    state.memory = Bytes[1, 0]
    state.a = 17_u8
    state.c = 2_u8
    state.cc.carry = true
    EightyEighty::Instruction::Arithmetic::SubtractRegisterWithBorrow.run(state).should eq(4)
    state.a.should eq(14)
    state.c.should eq(2)
    state.pc.should eq(1)
    state.cc.carry.should be_false
    state.cc.auxiliary_carry.should be_true
  end
end
