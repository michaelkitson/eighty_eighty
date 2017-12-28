require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::MoveToMemoryImmediate do
  it "writes to the location in hl" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[1] = 3_u8
    state.hl = 0x0102_u16
    EightyEighty::Instruction::DataTransfer::MoveToMemoryImmediate.run(state)
    state.memory[(1 << 8) + 2].should eq(3_u8)
    state.pc.should eq(2)
  end
end
