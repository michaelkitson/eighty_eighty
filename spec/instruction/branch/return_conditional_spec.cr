require "../../spec_helper"

describe EightyEighty::Instruction::Branch::ReturnConditional do
  it "RNZ" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16
    state.cc.zero = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.zero = false
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RZ" do
    state = EightyEighty::State.new
    state.memory  = Bytes[1 << 3, 1 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.zero = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RNC" do
    state = EightyEighty::State.new
    state.memory  = Bytes[2 << 3, 2 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16
    state.cc.carry = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.carry = false
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RC" do
    state = EightyEighty::State.new
    state.memory  = Bytes[3 << 3, 3 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.carry = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RPO" do
    state = EightyEighty::State.new
    state.memory  = Bytes[4 << 3, 4 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16
    state.cc.parity = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.parity = false
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RPE" do
    state = EightyEighty::State.new
    state.memory  = Bytes[5 << 3, 5 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.parity = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RP" do
    state = EightyEighty::State.new
    state.memory  = Bytes[6 << 3, 6 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16
    state.cc.signed = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.signed = false
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end

  it "RM" do
    state = EightyEighty::State.new
    state.memory  = Bytes[7 << 3, 7 << 3, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 8_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(1)
    state.sp.should eq(8)
    state.cc.signed = true
    EightyEighty::Instruction::Branch::ReturnConditional.run(state)
    state.pc.should eq(0)
    state.sp.should eq(10)
  end
end
