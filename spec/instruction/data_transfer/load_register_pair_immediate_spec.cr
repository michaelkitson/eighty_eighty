require "../../spec_helper"

describe EightyEighty::Instruction::DataTransfer::LoadRegisterPairImmediate do
  it "loads a bc pair" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0x01, 2, 0x24]
    EightyEighty::Instruction::DataTransfer::LoadRegisterPairImmediate.run(state)
    state.b.should eq(0x24)
    state.c.should eq(0x02)
    state.bc.should eq(0x2402)
    state.pc.should eq(3)
  end

  it "loads a de pair" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0x11, 2, 0x24]
    EightyEighty::Instruction::DataTransfer::LoadRegisterPairImmediate.run(state)
    state.d.should eq(0x24)
    state.e.should eq(0x02)
    state.de.should eq(0x2402)
    state.pc.should eq(3)
  end

  it "loads a hl pair" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0x21, 2, 0x24]
    EightyEighty::Instruction::DataTransfer::LoadRegisterPairImmediate.run(state)
    state.h.should eq(0x24)
    state.l.should eq(0x02)
    state.hl.should eq(0x2402)
    state.pc.should eq(3)
  end

  it "loads a stack pointer" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0x31, 2, 0x24]
    EightyEighty::Instruction::DataTransfer::LoadRegisterPairImmediate.run(state)
    state.sp.should eq(0x2402)
    state.pc.should eq(3)
  end
end
