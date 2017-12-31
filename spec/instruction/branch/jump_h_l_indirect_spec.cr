require "../../spec_helper"

describe EightyEighty::Instruction::Branch::JumpHLIndirect do
  it "changes the program counter to the hl value" do
    state = EightyEighty::State.new
    state.hl = 0x1234_u16
    EightyEighty::Instruction::Branch::JumpHLIndirect.run(state).should eq(5)
    state.pc.should eq(0x1234)
  end
end
