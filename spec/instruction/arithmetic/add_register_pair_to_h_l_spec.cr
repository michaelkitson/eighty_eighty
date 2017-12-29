require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::AddRegisterPairToHL do
  it "adds bc" do
    state = EightyEighty::State.new
    state.memory = Bytes[0]
    state.hl = 2_u16
    state.bc = 1_u16
    EightyEighty::Instruction::Arithmetic::AddRegisterPairToHL.run(state).should eq(10)
    state.hl.should eq(3)
    state.bc.should eq(1)
    state.pc.should eq(1)
    state.cc.carry.should be_false
  end

  it "adds hl" do
    state = EightyEighty::State.new
    state.memory = Bytes[2 << 4]
    state.hl = 0x8000_u16
    EightyEighty::Instruction::Arithmetic::AddRegisterPairToHL.run(state).should eq(10)
    state.hl.should eq(0)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.carry.should be_true
  end
end
