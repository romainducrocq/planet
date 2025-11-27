#  Make sure we can delete type conversions, load, and other instructions
#  * from Part II when they're dead stores
#  * 






pub l: i64 = 1l
pub i: i32 = 2
pub u: u32 = 30u

type struc s(    a: i32    , b: bool    , c: i32    
    )

pub fn target(none) i32 {
    #  everything except the return instruction should be deleted
    x: i64 = cast<i64>(i) #  dead sign extend
    y: u64 = cast<u64>(u) #  dead zero extend
    d: f64 = cast<f64>(y) + cast<f64>(i) #  dead IntToDouble and UIntToDouble
    x = cast<i64>(d) #  dead DoubleToInt
    y = cast<u64>(d) #  dead DoubleToUInt
    arr: [3]i32 = $(1, 2, 3) #  dead CopyToOffset
    j: i32 = arr[2] #  dead AddPtr and Load
    ptr: *bool = @i #  dead GetAddress
    c: char = cast<char>(l) #  dead truncate
    my_struct: struc s = $(0, 0, false)
    j = my_struct.b #  dead CopyFromOffset
    d = -d * 5.0 #  dead Binary/Unary instructions w/ non-int operands
    return 5
}

pub fn main(none) i32 {
    return target()
}
