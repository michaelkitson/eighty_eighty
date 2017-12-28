require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::Push do
  it "pushes bc" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 10_u16
    state.b = 1_u8
    state.c = 2_u8
    EightyEighty::Instruction::StackIOControl::Push.run(state)
    state.b.should eq(1)
    state.c.should eq(2)
    state.pc.should eq(1)
    state.sp.should eq(8)
  end

  it "pushes de" do
    state = EightyEighty::State.new
    state.memory = Bytes[1 << 4, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 10_u16
    state.d = 1_u8
    state.e = 2_u8
    EightyEighty::Instruction::StackIOControl::Push.run(state)
    state.d.should eq(1)
    state.e.should eq(2)
    state.pc.should eq(1)
    state.sp.should eq(8)
  end

  it "pushes hl" do
    state = EightyEighty::State.new
    state.memory = Bytes[2 << 4, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 10_u16
    state.h = 1_u8
    state.l = 2_u8
    EightyEighty::Instruction::StackIOControl::Push.run(state)
    state.h.should eq(1)
    state.l.should eq(2)
    state.pc.should eq(1)
    state.sp.should eq(8)
  end
end
