module EightyEighty::Instruction::DataTransfer::MoveImmediate
  MNEMONIC = "MVI"

  def self.run(state : State)
    state.destination_register = state.read_instruction_low_u8
    state.pc += 2
  end
end
