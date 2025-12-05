
#include <errno.h>

int get_errno(void) { return errno; }

void set_errno(int value) { errno = value; }

int get_EDOM(void) { return EDOM; }

int get_EILSEQ(void) { return EILSEQ; }

int get_ERANGE(void) { return ERANGE; }
