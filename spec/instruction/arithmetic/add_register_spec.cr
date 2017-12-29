require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::AddRegister do
  it "adds b" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0]
    state.a = 65_u8
    state.b = 255_u8
    EightyEighty::Instruction::Arithmetic::AddRegister.run(state).should eq(4)
    state.a.should eq(64)
    state.b.should eq(255)
    state.pc.should eq(1)
    state.cc.carry.should be_true
    state.cc.auxiliary_carry.should be_true
  end

  it "adds c" do
    state = EightyEighty::State.new
    state.memory = Bytes[1, 0]
    state.a = 15_u8
    state.c = 2_u8
    EightyEighty::Instruction::Arithmetic::AddRegister.run(state).should eq(4)
    state.a.should eq(17)
    state.c.should eq(2)
    state.pc.should eq(1)
    state.cc.carry.should be_false
    state.cc.auxiliary_carry.should be_true
  end
end
