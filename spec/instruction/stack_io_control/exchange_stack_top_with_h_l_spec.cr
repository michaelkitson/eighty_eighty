require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::ExchangeStackTopWithHL do
  it "pushes bc" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 3, 4]
    state.sp = 8_u16
    state.h = 1_u8
    state.l = 2_u8
    EightyEighty::Instruction::StackIOControl::ExchangeStackTopWithHL.run(state).should eq(18)
    state.h.should eq(4)
    state.l.should eq(3)
    state.memory[8].should eq(2)
    state.memory[9].should eq(1)
    state.pc.should eq(1)
    state.sp.should eq(8)
  end
end
