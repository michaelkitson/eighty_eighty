require "./condition_codes"

class EightyEighty::State
  property a : UInt8 = 0_u8
  property b : UInt8 = 0_u8
  property c : UInt8 = 0_u8
  property d : UInt8 = 0_u8
  property e : UInt8 = 0_u8
  property h : UInt8 = 0_u8
  property l : UInt8 = 0_u8
  property sp : UInt16 = 0_u16
  property pc : UInt16 = 0_u16
  property memory : Bytes = Bytes.new(2**16)
  property cc : ConditionCodes = ConditionCodes.new
  property interrupts_enabled : Bool = false

  def bc : UInt16
    (@b.to_u16 << 8) + @c
  end

  def de : UInt16
    (@d.to_u16 << 8) + @e
  end

  def hl : UInt16
    (@h.to_u16 << 8) + @l
  end

  def bc=(val : UInt16) : UInt16
    @b = (val >> 8).to_u8
    @c = val.to_u8
    bc
  end

  def de=(val : UInt16) : UInt16
    @d = (val >> 8).to_u8
    @e = val.to_u8
    de
  end

  def hl=(val : UInt16) : UInt16
    @h = (val >> 8).to_u8
    @l = val.to_u8
    hl
  end

  def read_instruction_op : UInt8
    @memory[@pc]
  end

  def read_instruction_u8 : UInt8
    read_instruction_low_u8
  end

  def read_instruction_low_u8 : UInt8
    @memory[@pc + 1]
  end

  def read_instruction_high_u8 : UInt8
    @memory[@pc + 2]
  end

  def read_instruction_u16 : UInt16
    (read_instruction_high_u8.to_u16 << 8) + read_instruction_low_u8
  end

  def source_register : UInt8
    case read_instruction_op & 0b111_u8
    when 0 then @b
    when 1 then @c
    when 2 then @d
    when 3 then @e
    when 4 then @h
    when 5 then @l
    when 7 then @a
    else        raise "Invalid Register Source"
    end
  end

  def destination_register : UInt8
    case (read_instruction_op >> 3) & 0b111_u8
    when 0 then @b
    when 1 then @c
    when 2 then @d
    when 3 then @e
    when 4 then @h
    when 5 then @l
    when 7 then @a
    else        raise "Invalid Register Destination"
    end
  end

  def destination_register=(val : UInt8) : UInt8
    case (read_instruction_op >> 3) & 0b111_u8
    when 0 then @b = val
    when 1 then @c = val
    when 2 then @d = val
    when 3 then @e = val
    when 4 then @h = val
    when 5 then @l = val
    when 7 then @a = val
    else        raise "Invalid Register Destination"
    end
  end

  def register_pair : UInt16
    case (read_instruction_op & 0b00110000_u8) >> 4
    when 0 then bc
    when 1 then de
    when 2 then hl
    when 3 then @sp
    else        raise "Invalid Register Pair"
    end
  end

  def register_pair=(val : UInt16) : UInt16
    case (read_instruction_op & 0b00110000_u8) >> 4
    when 0 then self.bc = val
    when 1 then self.de = val
    when 2 then self.hl = val
    when 3 then @sp = val
    else        raise "Invalid Register Pair"
    end
  end

  def condition?
    case (read_instruction_op >> 3) & 0b111_u8
    when 0 then !@cc.zero
    when 1 then @cc.zero
    when 2 then !@cc.carry
    when 3 then @cc.carry
    when 4 then !@cc.parity
    when 5 then @cc.parity
    when 6 then !@cc.signed
    when 7 then @cc.signed
    end
  end
end
