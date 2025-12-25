use "time"

pub fn main(none) i32 {
    rawtime: u64;
    timeinfo: *struc tm = nil
    timebuf: [128]char = $(nil)

    get_CLOCKS_PER_SEC()
    get_TIME_UTC()

    time(@rawtime)
    timeinfo = localtime(@rawtime)
    strftime(timebuf, 80, "%x at %I:%M%p", timeinfo)

    rawtime = mktime(timeinfo)
    timeinfo = gmtime(@rawtime)
    asctime(timeinfo)
    ctime(@rawtime)

    if difftime(rawtime, clock()) < 0 {
        return 1
    }

    return 0
}
