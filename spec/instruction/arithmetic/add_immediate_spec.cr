require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::AddImmediate do
  it "adds the an immediate" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 15]
    state.a = 1_u8
    EightyEighty::Instruction::Arithmetic::AddImmediate.run(state).should eq(7)
    state.a.should eq(16)
    state.pc.should eq(2)
    state.cc.auxiliary_carry.should be_true
  end
end
