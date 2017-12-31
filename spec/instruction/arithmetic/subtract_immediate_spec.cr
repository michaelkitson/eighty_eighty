require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::SubtractImmediate do
  it "subtracts an immediate" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 2]
    state.a = 17_u8
    EightyEighty::Instruction::Arithmetic::SubtractImmediate.run(state).should eq(7)
    state.a.should eq(15)
    state.pc.should eq(2)
    state.cc.carry.should be_false
    state.cc.auxiliary_carry.should be_true
  end
end
