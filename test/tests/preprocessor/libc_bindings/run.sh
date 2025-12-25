#!/bin/bash

planet test_abort.plx
if [ ${?} -ne 0 ]; then exit 1; fi

! ($(./test_abort > /dev/null 2>&1) || false)
if [ ${?} -ne 0 ]; then exit 1; fi

planet test_assert.plx
if [ ${?} -ne 0 ]; then exit 1; fi

! ($(./test_assert 1 > /dev/null 2>&1) || false)
if [ ${?} -ne 0 ]; then exit 1; fi

./test_assert 2
if [ ${?} -ne 0 ]; then exit 1; fi

planet test_errno.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./test_errno
if [ ${?} -ne 0 ]; then exit 1; fi

planet test_locale.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./test_locale
if [ ${?} -ne 0 ]; then exit 1; fi

planet -lm -lmath2 test_math.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./test_math
if [ ${?} -ne 0 ]; then exit 1; fi

planet test_time.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./test_time
if [ ${?} -ne 0 ]; then exit 1; fi

planet -lat_quick_exit -latexit -lbsearch -lqsort test_stdlib.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./test_stdlib
if [ ${?} -ne 0 ]; then exit 1; fi

echo "SUCCESS"
