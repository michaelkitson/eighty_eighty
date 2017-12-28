require "../../spec_helper"

describe EightyEighty::Instruction::Branch::Return do
  it "changes the program counter" do
    state = EightyEighty::State.new
    state.memory = Bytes[
      0, 10, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    ]
    state.sp = 19_u16 # Set up the stack at the bottom of the 20 byte memory slice

    EightyEighty::Instruction::Branch::Call.run(state)

    state.pc.should eq(10)
    state.sp.should eq(17)
    state.memory[17].should eq(3)
    state.memory[18].should eq(0)

    EightyEighty::Instruction::Branch::Return.run(state)

    state.pc.should eq(3)
    state.sp.should eq(19)
  end
end
