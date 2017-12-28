require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::MoveToMemory do
  it "writes from l" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[0] = 0b01110101_u8
    state.hl = 0x0102_u16
    EightyEighty::Instruction::DataTransfer::MoveToMemory.run(state)
    state.memory[(1 << 8) + 2].should eq(2_u8)
    state.pc.should eq(1)
  end
end
  