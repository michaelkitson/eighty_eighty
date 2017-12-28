require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::EnableInterrupts do
  it "enables interrupts" do
    state = EightyEighty::State.new
    EightyEighty::Instruction::StackIOControl::EnableInterrupts.run(state)
    state.interrupts_enabled.should be_true
    state.pc.should eq(1)
  end
end
