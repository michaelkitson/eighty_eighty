require "../../spec_helper"

describe EightyEighty::Instruction::Branch::Call do
  it "changes the program counter" do
    state = EightyEighty::State.new
    state.memory  = Bytes[0, 0xd4, 0x18, 0, 0, 0, 0, 0, 0, 0]
    state.sp = 9_u16 # Set up the stack at the bottom of the 10 byte memory slice

    EightyEighty::Instruction::Branch::Call.run(state)

    state.pc.should eq(0x18d4)
    state.sp.should eq(7)
    state.memory[7].should eq(3)
    state.memory[8].should eq(0)
  end
end
