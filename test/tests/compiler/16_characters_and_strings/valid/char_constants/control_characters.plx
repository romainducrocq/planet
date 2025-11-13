#  Make sure we can handle control characters that are in the source character set 

pub fn main(none) i32 {
    tab: i32 = '	'
    vertical_tab: i32 = ''
    form_feed: i32 = ''
    if tab ~= '\t' {
        return true
    }
    if vertical_tab ~= '\v' {
        return 2
    }

    if form_feed ~= '\f' {
        return 3
    }

    return 0
}
