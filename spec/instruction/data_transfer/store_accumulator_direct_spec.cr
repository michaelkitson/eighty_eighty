require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::StoreAccumulatorDirect do
  it "stores to a memory location" do
    state = EightyEighty::State.new
    state.memory = Bytes.new((1 << 8) + 8)
    state.memory[1] = 2_u8
    state.memory[2] = 1_u8
    state.a = 3_u8
    EightyEighty::Instruction::DataTransfer::StoreAccumulatorDirect.run(state).should eq(13)
    state.memory[(1 << 8) + 2].should eq(3)
    state.a.should eq(3)
    state.pc.should eq(3)
  end
end
