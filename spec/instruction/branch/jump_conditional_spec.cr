require "../../spec_helper"

describe EightyEighty::Instruction::Branch::JumpConditional do
  it "JNZ" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
    state.pc = 0_u16
    state.cc.zero = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
  end

  it "JZ" do
    state = EightyEighty::State.new
    state.memory = Bytes[1 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
    state.pc = 0_u16
    state.cc.zero = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
  end

  it "JNC" do
    state = EightyEighty::State.new
    state.memory = Bytes[2 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
    state.pc = 0_u16
    state.cc.carry = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
  end

  it "JC" do
    state = EightyEighty::State.new
    state.memory = Bytes[3 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
    state.pc = 0_u16
    state.cc.carry = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
  end

  it "JPO" do
    state = EightyEighty::State.new
    state.memory = Bytes[4 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
    state.pc = 0_u16
    state.cc.parity = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
  end

  it "JPE" do
    state = EightyEighty::State.new
    state.memory = Bytes[5 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
    state.pc = 0_u16
    state.cc.parity = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
  end

  it "JP" do
    state = EightyEighty::State.new
    state.memory = Bytes[6 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
    state.pc = 0_u16
    state.cc.signed = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
  end

  it "JM" do
    state = EightyEighty::State.new
    state.memory = Bytes[7 << 3, 0, 0]
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(3)
    state.pc = 0_u16
    state.cc.signed = true
    EightyEighty::Instruction::Branch::JumpConditional.run(state).should eq(10)
    state.pc.should eq(0)
  end
end
