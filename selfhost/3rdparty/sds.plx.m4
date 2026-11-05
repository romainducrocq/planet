m4_ifdef(`_LIB_SDS_M4', `', `
m4_define(`_LIB_SDS_M4', `')m4_dnl

# SDSLib 2.0 -- A C dynamic strings library
#
# Copyright (c) 2006-2015, Salvatore Sanfilippo <antirez at gmail dot com>
# Copyright (c) 2015, Oran Agra
# Copyright (c) 2015, Redis Labs, Inc
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#   * Redistributions of source code must retain the above copyright notice,
#     this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#   * Neither the name of Redis nor the names of its contributors may be used
#     to endorse or promote products derived from this software without
#     specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

m4_define(`sds', `string')m4_dnl

pub fn sdslen(s: sds) u64;
pub fn sdsnew(init: string) sds;
pub fn sdsdup(s: sds) sds;
pub fn sdsfree(s: sds) none;
pub fn sdsgrowzero(s: sds, len: u64) sds;
pub fn sdscat(s: sds, t: string) sds;

pub fn sdsrange(s: sds, start: i64, end: i64) none;
pub fn sdsclear(s: sds) none;
pub fn sdsfromlong(value: i64) sds;
pub fn sdsfromunsignedlong(value: u64) sds;

# Low level functions exposed to the user API
pub fn sdsMakeRoomFor(s: sds, addlen: u64) sds;

')m4_dnl
