require "../../spec_helper"

describe EightyEighty::Instruction::Branch::CallConditional do
  it "CNZ" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    state.cc.zero = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.zero = false
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CZ" do
    state = EightyEighty::State.new
    state.memory  = Bytes[1 << 3, 0, 0, 1 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.zero = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CNC" do
    state = EightyEighty::State.new
    state.memory  = Bytes[2 << 3, 0, 0, 2 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    state.cc.carry = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.carry = false
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CC" do
    state = EightyEighty::State.new
    state.memory  = Bytes[3 << 3, 0, 0, 3 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.carry = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CPO" do
    state = EightyEighty::State.new
    state.memory  = Bytes[4 << 3, 0, 0, 4 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    state.cc.parity = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.parity = false
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CPE" do
    state = EightyEighty::State.new
    state.memory  = Bytes[5 << 3, 0, 0, 5 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.parity = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CP" do
    state = EightyEighty::State.new
    state.memory  = Bytes[6 << 3, 0, 0, 6 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    state.cc.signed = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.signed = false
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end

  it "CM" do
    state = EightyEighty::State.new
    state.memory  = Bytes[7 << 3, 0, 0, 7 << 3, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(11)
    state.pc.should eq(3)
    state.cc.signed = true
    EightyEighty::Instruction::Branch::CallConditional.run(state).should eq(17)
    state.pc.should eq(0)
    state.sp.should eq(7)
    state.memory[7].should eq(6)
    state.memory[8].should eq(0)
  end
end
