require "../../spec_helper"

base_op = 0b00000110_u8

describe EightyEighty::Instruction::DataTransfer::MoveImmediate do
  it "loads to b" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (0 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.b.should eq(1)
    state.pc.should eq(2)
  end

  it "loads to c" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (1 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.c.should eq(1)
    state.pc.should eq(2)
  end

  it "loads to d" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (2 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.d.should eq(1)
    state.pc.should eq(2)
  end

  it "loads to e" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (3 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.e.should eq(1)
    state.pc.should eq(2)
  end

  it "loads to h" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (4 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.h.should eq(1)
    state.pc.should eq(2)
  end

  it "loads to l" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (5 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.l.should eq(1)
    state.pc.should eq(2)
  end

  it "loads to a" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | (7 << 3), 1]
    EightyEighty::Instruction::DataTransfer::MoveImmediate.run(state).should eq(7)
    state.a.should eq(1)
    state.pc.should eq(2)
  end
end