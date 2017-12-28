module EightyEighty::Instruction::DataTransfer::MoveRegister
  MNEMONIC = "MOV"

  def self.run(state : State)
    state.destination_register = state.source_register
    state.pc += 1
  end
end
