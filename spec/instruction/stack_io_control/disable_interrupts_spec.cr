require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::DisableInterrupts do
  it "disables interrupts" do
    state = EightyEighty::State.new
    state.interrupts_enabled = true
    EightyEighty::Instruction::StackIOControl::DisableInterrupts.run(state).should eq(4)
    state.interrupts_enabled.should be_false
    state.pc.should eq(1)
  end
end
