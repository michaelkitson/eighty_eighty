require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::LoadAccumulatorIndirect do
  it "loads a bc memory location" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[0] = 0b00001010_u8
    state.memory[(1 << 8) + 2] = 3_u8
    state.b = 1_u8
    state.c = 2_u8
    EightyEighty::Instruction::DataTransfer::LoadAccumulatorIndirect.run(state)
    state.b.should eq(1)
    state.c.should eq(2)
    state.a.should eq(3)
    state.pc.should eq(1)
  end
end

describe EightyEighty::Instruction::DataTransfer::LoadAccumulatorIndirect do
  it "loads a de memory location" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[0] = 0b00011010_u8
    state.memory[(1 << 8) + 2] = 3_u8
    state.d = 1_u8
    state.e = 2_u8
    EightyEighty::Instruction::DataTransfer::LoadAccumulatorIndirect.run(state)
    state.d.should eq(1)
    state.e.should eq(2)
    state.a.should eq(3)
    state.pc.should eq(1)
  end
end
  