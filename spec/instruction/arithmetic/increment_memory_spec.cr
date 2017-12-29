require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::IncrementMemory do
  it "increments bc" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[(1 << 8) + 2] = 255_u8
    state.hl = 0x0102_u16
    EightyEighty::Instruction::Arithmetic::IncrementMemory.run(state).should eq(10)
    state.memory[(1 << 8) + 2].should eq(0_u8)
    state.cc.zero.should be_true
    state.cc.signed.should be_false
    state.cc.carry.should be_true
    state.cc.parity.should be_true
    state.pc.should eq(1)
  end
end
