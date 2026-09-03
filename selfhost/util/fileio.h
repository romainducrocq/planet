#ifndef _UTIL_FILEIO_H
#define _UTIL_FILEIO_H

#include "../lib/c_std.h"

#include "../util/throw.h"

struct ErrorsContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// File io

struct FileRead {
    unsigned long len;
    char* buf;
    struct FILE* fd;
    string_t filename;
};

struct FileIoContext {
    struct ErrorsContext* errors;
    // File io
    struct FILE* fd_write;
    string_t write_buf;
    string_t filename;
    vector_t(struct FileRead) file_reads;
};

bool find_file(char* filename);
char* get_filename(struct FileIoContext* ctx);
void set_filename(struct FileIoContext* ctx, string_t filename);
error_t open_fread(struct FileIoContext* ctx, string_t filename);
error_t open_fwrite(struct FileIoContext* ctx, string_t filename);
bool read_line(struct FileIoContext* ctx, char** line, unsigned long* line_size);
void write_buffer(struct FileIoContext* ctx, char* buf);
error_t close_fread(struct FileIoContext* ctx, unsigned long linenum);
void close_fwrite(struct FileIoContext* ctx);
void free_fileio(struct FileIoContext* ctx);

#endif
