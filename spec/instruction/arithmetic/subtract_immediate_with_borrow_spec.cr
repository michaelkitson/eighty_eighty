require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::SubtractImmediateWithBorrow do
  it "subtracts an immediate" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 2]
    state.a = 17_u8
    state.cc.carry = true
    EightyEighty::Instruction::Arithmetic::SubtractImmediateWithBorrow.run(state).should eq(7)
    state.a.should eq(14)
    state.pc.should eq(2)
    state.cc.carry.should be_false
    state.cc.auxiliary_carry.should be_true
  end
end
