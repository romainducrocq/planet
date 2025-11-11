pub fn get_max(a: f64, b: f64, c: f64, d: f64, e: f64, f: f64, g: f64, h: f64, i: f64, j: f64, k: f64) f64;



pub fn main(none) bool {
    result: f64 = get_max(100.3, 200.1
        , 0.01, 1.00004e5, 55.555
        , -4., 6543.2,         9e9, 8e8, 7.6, 10e3 * 11e5)
    return result == 10e3 * 11e5
}
