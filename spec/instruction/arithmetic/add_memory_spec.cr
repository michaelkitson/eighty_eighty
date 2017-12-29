require "../../spec_helper"

describe EightyEighty::Instruction::Arithmetic::AddMemory do
  it "adds the memory value" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[(1 << 8) + 2] = 255_u8
    state.hl = 0x0102_u16
    state.a = 3_u8
    EightyEighty::Instruction::Arithmetic::AddMemory.run(state).should eq(7)
    state.memory[(1 << 8) + 2].should eq(255_u8)
    state.a.should eq(2)
    state.pc.should eq(1)
  end
end
