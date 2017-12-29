require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::DecrementMemory do
  it "decrements bc" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[(1 << 8) + 2] = 4_u8
    state.hl = 0x0102_u16
    EightyEighty::Instruction::Arithmetic::DecrementMemory.run(state).should eq(10)
    state.memory[(1 << 8) + 2].should eq(3_u8)
    state.pc.should eq(1)
    state.cc.zero.should be_false
    state.cc.signed.should be_false
    state.cc.carry.should be_false
    state.cc.parity.should be_true
  end
end
