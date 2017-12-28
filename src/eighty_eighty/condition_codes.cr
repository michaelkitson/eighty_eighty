class EightyEighty::ConditionCodes
  property zero : Bool = false
  property signed : Bool = false
  property parity : Bool = false
  property carry : Bool = false
  property auxiliary_carry : Bool = false

  def set_from(val : UInt8)
    @zero = val == 0
    @signed = val >= 0x80
    @parity = val.popcount % 2 == 0
    nil
  end

  def set_from(val : UInt16)
    @zero = val == 0
    @signed = val >= 0x8000
    @parity = val.popcount % 2 == 0
    nil
  end

  def psw : UInt8
    val = 2_u8
    val |= 1 if @carry
    val |= 4 if @parity
    val |= 16 if @auxiliary_carry
    val |= 64 if @zero
    val |= 128 if @signed
    val
  end

  def psw=(val : UInt8)
    @carry = val.bit(0) > 0
    @parity = val.bit(2) > 0
    @auxiliary_carry = val.bit(4) > 0
    @zero = val.bit(6) > 0
    @signed = val.bit(7) > 0
    nil
  end
end
