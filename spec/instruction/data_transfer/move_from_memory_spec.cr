require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::MoveFromMemory do
  it "reads to d" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[0] = 0b01010110_u8
    state.memory[(1 << 8) + 2] = 3_u8
    state.hl = 0x0102_u16
    EightyEighty::Instruction::DataTransfer::MoveFromMemory.run(state).should eq(7)
    state.d.should eq(3)
    state.pc.should eq(1)
  end
end
  