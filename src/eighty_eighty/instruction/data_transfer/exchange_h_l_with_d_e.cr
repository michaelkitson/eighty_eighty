module EightyEighty::Instruction::DataTransfer::ExchangeHLWithDE
  MNEMONIC = "XCHG"

  def self.run(state : State)
    hl = state.hl
    de = state.de
    state.hl = de
    state.de = hl
    state.pc += 1
  end
end
