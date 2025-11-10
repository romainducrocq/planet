pub fn main(none) i32 {
    ui: u32 = 10u

    match ui {
        -> 4294967295u { #  2^32 - 1
            return 0
        }
        -> 1099511627775l { #  0x0000_00ff_ffff_ffff; this will be converted to 2^32 - 1
            return 1
        }
        otherwise {
            return 2
        }
    }
}
