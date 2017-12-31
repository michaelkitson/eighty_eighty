require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::SubtractMemoryWithBorrow do
  it "subtracts the memory value" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[(1 << 8) + 2] = 255_u8
    state.hl = 0x0102_u16
    state.a = 3_u8
    state.cc.carry = true
    EightyEighty::Instruction::Arithmetic::SubtractMemoryWithBorrow.run(state).should eq(7)
    state.memory[(1 << 8) + 2].should eq(255_u8)
    state.a.should eq(3)
    state.pc.should eq(1)
    state.cc.carry.should be_true
    state.cc.auxiliary_carry.should be_true
  end
end
