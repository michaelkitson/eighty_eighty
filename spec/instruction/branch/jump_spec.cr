require "../../spec_helper"

describe EightyEighty::Instruction::Branch::Jump do
  it "changes the program counter" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0xd4, 0x18]
    EightyEighty::Instruction::Branch::Jump.run(state)
    state.pc.should eq(0x18d4)
  end
end
