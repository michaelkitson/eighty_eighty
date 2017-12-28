require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::Pop do
  it "pops into bc" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 2, 1]
    state.sp = 8_u16
    EightyEighty::Instruction::StackIOControl::Pop.run(state)
    state.b.should eq(1)
    state.c.should eq(2)
    state.pc.should eq(1)
    state.sp.should eq(10)
  end

  it "pops into de" do
    state = EightyEighty::State.new
    state.memory = Bytes[1 << 4, 0, 0, 0, 0, 0, 0, 0, 2, 1]
    state.sp = 8_u16
    EightyEighty::Instruction::StackIOControl::Pop.run(state)
    state.d.should eq(1)
    state.e.should eq(2)
    state.pc.should eq(1)
    state.sp.should eq(10)
  end

  it "pops into hl" do
    state = EightyEighty::State.new
    state.memory = Bytes[2 << 4, 0, 0, 0, 0, 0, 0, 0, 2, 1]
    state.sp = 8_u16
    EightyEighty::Instruction::StackIOControl::Pop.run(state)
    state.h.should eq(1)
    state.l.should eq(2)
    state.pc.should eq(1)
    state.sp.should eq(10)
  end
end
