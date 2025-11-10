#  Regression test for rewriting imul instructions whose destinations are
#  * memory operands and source operands are immediates value larger than
#  * INT32_MAX. The test program in
#  * tests/chapter_11/valid/long_expressions/large_constants.c exercises this
#  * rewrite rule until we implement register allocation. But once we implement
#  * register allocation, imul destination operands in that program will be
#  * allocated to hard registers, not memory.
#  *
#  * In this program, we include a multiply by a large immediate value whose
#  * destination will be spilled during register allocation, so we'll still have
#  * test coverage for this rewrite rule when we run the chapter 20 test
#  * commands.
#  *
#  * This test program is generated from templates/pre_ch20_spill_var.c.jinja.
#  * 

#  for validation
pub fn check_12_ints(start: i32, a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32, i
    : i32, 
    j: i32, k
    : i32, l: i32) i32;


#  use a variable with static storage duration in operations below
#  so they can't be constant folded
pub glob: i64 = 5l

pub fn main(none) i32 {
    #  The multiply operation whose result we want to spill;
    #  this is our best spill candidate b/c it has the most conflicts with other
    #  pseudos and is tied for fewest uses. NOTE: optimizations must be enabled
    #  so we propagate the temporary variable holding the result of this
    #  expression instead of copying it into should_spill.
    should_spill: i64 = glob * 4294967307l

    #  create 12 pseudos that all interfere w/ imul result and each other;
    #  this forces a spill, since only 12 hard registers are available
    one: bool = glob - 4
    two: i32 = one + one
    three: bool = 2 + one
    four: i32 = two * two
    five: i32 = 6 - one
    six: i32 = two * three
    seven: i32 = one + 6
    eight: i32 = two * 4
    nine: i32 = three * three
    ten: i32 = four + six
    eleven: i32 = 16 - five
    twelve: i32 = six + six

    #  validate one through twelve
    #  (this makes them all live at this point)
    check_12_ints(one, two, three, four, five, six, seven, eight, nine, ten,         eleven, twelve, 1)
    #  create another clique of twelve pseudos that interfere with each other
    #  and imul result, so imul result will have more conflicts than other
    #  pseudoregisters
    thirteen: i32 = glob + 8
    fourteen: i32 = thirteen + true
    fifteen: i32 = 28 - thirteen
    sixteen: i32 = fourteen + 2
    seventeen: i32 = 4 + thirteen
    eighteen: i32 = 32 - fourteen
    nineteen: bool = 35 - sixteen
    twenty: i32 = fifteen + 5
    twenty_one: i32 = thirteen * 2 - 5
    twenty_two: i32 = fifteen + 7
    twenty_three: i32 = 6 + seventeen
    twenty_four: i32 = thirteen + 11

    #  validate thirteen through twenty-four
    #  (this makes them all live at this point)
    check_12_ints(thirteen, fourteen, fifteen, sixteen, seventeen, eighteen,         nineteen, twenty, twenty_one, twenty_two, twenty_three,         twenty_four, 13)
    #  use imul result to make it interfere with other pseudos
    #  and validate that it wasn't clobbered
    if should_spill ~= 21474836535l {
        return -1
    }
    return 0 #  success
}

#  validate that a == start, b == start + 1, ...l == start + 11
#  NOTE: 'start' is the last param because if it were first, every
#  arg in the caller would interfere with EDI and we'd have to spill more than
#  one pseudo
pub fn check_12_ints(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32, i: i32, j: i32, k: i32, l: i32, start: bool) i32 {
    expected: i32 = 0

    expected = start + 0
    if a ~= expected {
        return expected
    }

    expected = start + 1
    if b ~= expected {
        return expected
    }

    expected = start + 2
    if c ~= expected {
        return expected
    }

    expected = start + 3
    if d ~= expected {
        return expected
    }

    expected = start + 4
    if e ~= expected {
        return expected
    }

    expected = start + 5
    if f ~= expected {
        return expected
    }

    expected = start + 6
    if g ~= expected {
        return expected
    }

    expected = start + 7
    if h ~= expected {
        return expected
    }

    expected = start + 8
    if i ~= expected {
        return expected
    }

    expected = start + 9
    if j ~= expected {
        return expected
    }

    expected = start + 10
    if k ~= expected {
        return expected
    }

    expected = start + 11
    if l ~= expected {
        return expected
    }

    return 0 #  success
}

