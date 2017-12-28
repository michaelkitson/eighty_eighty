module EightyEighty::Instruction::StackIOControl::Halt
  MNEMONIC = "HLT"

  def self.run(state : State)
    puts "Halting"
    exit(0)
  end
end