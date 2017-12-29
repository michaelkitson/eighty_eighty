require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::StoreHLDirect do
  it "stores to a memory location" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[1] = 2_u8
    state.memory[2] = 1_u8
    state.h = 4_u8
    state.l = 3_u8
    EightyEighty::Instruction::DataTransfer::StoreHLDirect.run(state).should eq(16)
    state.memory[(1 << 8) + 2] = 3_u8
    state.memory[(1 << 8) + 3] = 4_u8
    state.h.should eq(4)
    state.l.should eq(3)
    state.pc.should eq(3)
  end
end
