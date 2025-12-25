use "signal"

sig_val: i32 = 1

pub fn puts(s: string) i32;
pub fn main(none) i32 {
    get_SIGABRT()
    get_SIGFPE()
    get_SIGILL()
    get_SIGINT()
    get_SIGSEGV()
    get_SIGTERM()

    if signal_dfl(get_SIGABRT()) {
        return 2
    }
    if signal_ign(get_SIGILL()) {
        return 3
    }

    if signal_f(get_SIGINT()) {
        return 4
    }
    if signal_f(get_SIGSEGV()) {
        return 5
    }

    if raise(get_SIGINT()) {
        return 6
    }
    if raise(get_SIGSEGV()) {
        return 7
    }

    return sig_val
}

pub fn signal_func(sig: i32) none {
    if sig == get_SIGINT() {
        sig_val = 8
    }
    elif sig == get_SIGSEGV() {
        sig_val = ? (
            sig_val == 8) then 0 else 9
        puts("Hello signal!")
    }
}
