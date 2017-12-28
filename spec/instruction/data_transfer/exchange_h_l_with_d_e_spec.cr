require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::ExchangeHLWithDE do
  it "swaps the register values" do
    state = EightyEighty::State.new
    state.h = 1_u8
    state.l = 2_u8
    state.d = 3_u8
    state.e = 4_u8
    EightyEighty::Instruction::DataTransfer::ExchangeHLWithDE.run(state)
    state.h.should eq(3)
    state.l.should eq(4)
    state.d.should eq(1)
    state.e.should eq(2)
    state.pc.should eq(1)
  end
end
