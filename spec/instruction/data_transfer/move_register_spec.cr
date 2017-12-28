require "../../spec_helper"

base_op = 0b01000000_u8

describe EightyEighty::Instruction::DataTransfer::MoveRegister do
  it "moves b to a" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | 0b00111000, 1]
    state.b = 1_u8
    EightyEighty::Instruction::DataTransfer::MoveRegister.run(state)
    state.b.should eq(1)
    state.a.should eq(1)
    state.pc.should eq(1)
  end

  it "moves d to l" do
    state = EightyEighty::State.new
    state.memory = Bytes[base_op | 0b00101010, 1]
    state.d = 2_u8
    EightyEighty::Instruction::DataTransfer::MoveRegister.run(state)
    state.d.should eq(2)
    state.l.should eq(2)
    state.pc.should eq(1)
  end
end