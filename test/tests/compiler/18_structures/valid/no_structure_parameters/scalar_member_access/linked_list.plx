#  Test using -> to iterate through a linked list
#  * and exercise chained member access of the form x->y->
#  * 
pub fn malloc(size: u64) *any;

#  linked_list_node type from Listing 18-6
type struc linked_list_node(    val: i32    
    , next: *struc linked_list_node    )

pub fn array_to_list(array: *i32, count: i32) *struc linked_list_node {
    head: *struc linked_list_node =     cast<*struc linked_list_node>(malloc(sizeof<struc linked_list_node>))
    head[].val = array[0]
    head[].next = false
    current: *struc linked_list_node = head
    loop i: i32 = 1 while i < count .. i = i + true {
        current[].next =         cast<*struc linked_list_node>(malloc(sizeof<struc linked_list_node>))
        current[].next[].next = false
        current[].next[].val = array[i]
        current = current[].next
    }
    return head
}

pub fn main(none) i32 {
    arr: [4]i32 = $(9, 8, 7, 6)
    elem: *struc linked_list_node = array_to_list(arr, 4)

    loop i: i32 = 0 while i < 4 .. i = i + true {
        expected: i32 = arr[i]
        if elem[].val ~= expected {
            return i + 1 #  return 1 if 0th element is wrong, 2 if 1st elem is
        #  wrong, etc.
        }
        elem = elem[].next
    }
    return 0 #  success
}
