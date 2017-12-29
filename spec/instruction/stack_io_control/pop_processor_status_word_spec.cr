require "../../spec_helper"

describe EightyEighty::Instruction::StackIOControl::PopProcessorStatusWord do
  it "pushes correctly" do
    state = EightyEighty::State.new
    state.memory = Bytes[0, 0, 0, 0, 0, 0, 0, 0, 150, 1]
    state.sp = 8_u16
    EightyEighty::Instruction::StackIOControl::PopProcessorStatusWord.run(state).should eq(10)
    state.a.should eq(1)
    state.pc.should eq(1)
    state.sp.should eq(10)
    state.cc.carry.should be_false
    state.cc.parity.should be_true
    state.cc.auxiliary_carry.should be_true
    state.cc.zero.should be_false
    state.cc.signed.should be_true
    state.cc.psw.should eq(150)
  end
end
