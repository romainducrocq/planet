#include "fileio.h"
#include "throw.h"

#include "../lib/c_std.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Throw

#define Ctx struct ErrorsContext*

#define ESC 27
#define ESC_RESET_SIZE 4
#define ESC_BOLD_SIZE 4
#define ESC_RED_SIZE 7
static char esc_reset[5] = {ESC, '[', '0', 'm', 0};
static char esc_bold[5] = {ESC, '[', '1', 'm', 0};
static char esc_red[8] = {ESC, '[', '0', ';', '3', '1', 'm', 0};

void panic_sigabrt(char* msg, int line, char* file) {
    fflush(NULL);
    {
        string_t strto_line = str_to_string(line);

        string_t stderr_buf = str_new("");
        unsigned long stderr_buf_size = strlen("::\ninternal error: \n") + ESC_BOLD_SIZE + strlen(file)
                                        + str_size(strto_line) + ESC_RESET_SIZE + ESC_RED_SIZE + ESC_RESET_SIZE
                                        + strlen(msg);
        str_reserve(stderr_buf, stderr_buf_size);

        str_append(stderr_buf, esc_bold);
        str_append(stderr_buf, file);
        str_append(stderr_buf, ":");
        str_append(stderr_buf, strto_line);
        str_append(stderr_buf, ":");
        str_append(stderr_buf, esc_reset);
        str_append(stderr_buf, "\n");
        str_append(stderr_buf, esc_red);
        str_append(stderr_buf, "internal error:");
        str_append(stderr_buf, esc_reset);
        str_append(stderr_buf, " ");
        str_append(stderr_buf, msg);
        str_append(stderr_buf, "\n");

        write(STDERR_FILENO, stderr_buf, str_size(stderr_buf));

        str_delete(strto_line);
        str_delete(stderr_buf);
    }
    abort();
}

void raise_init_error(Ctx ctx) {
    if (ctx->is_stdout) {
        printf("%s", "\n");
        fflush(NULL);
    }

    string_t stderr_buf = str_new("");
    unsigned long stderr_buf_size = strlen("error: \n") + ESC_RED_SIZE + ESC_RESET_SIZE + strlen(ctx->msg);
    str_reserve(stderr_buf, stderr_buf_size);

    str_append(stderr_buf, esc_red);
    str_append(stderr_buf, "error:");
    str_append(stderr_buf, esc_reset);
    str_append(stderr_buf, " ");
    str_append(stderr_buf, ctx->msg);
    str_append(stderr_buf, "\n");
    THROW_ABORT_IF(str_size(stderr_buf) != stderr_buf_size);

    write(STDERR_FILENO, stderr_buf, str_size(stderr_buf));

    str_delete(stderr_buf);
}

void raise_base_error(Ctx ctx) {
    free_fileio(ctx->fileio);
    char* filename = get_filename(ctx->fileio);
    if (!filename) {
        filename = "";
    }
    if (ctx->is_stdout) {
        printf("%s", "\n");
        fflush(NULL);
    }

    string_t stderr_buf = str_new("");
    unsigned long stderr_buf_size = strlen(":\nerror: \n") + ESC_BOLD_SIZE + strlen(filename) + ESC_RESET_SIZE
                                    + ESC_RED_SIZE + ESC_RESET_SIZE + strlen(ctx->msg);
    str_reserve(stderr_buf, stderr_buf_size);

    str_append(stderr_buf, esc_bold);
    str_append(stderr_buf, filename);
    str_append(stderr_buf, ":");
    str_append(stderr_buf, esc_reset);
    str_append(stderr_buf, "\n");
    str_append(stderr_buf, esc_red);
    str_append(stderr_buf, "error:");
    str_append(stderr_buf, esc_reset);
    str_append(stderr_buf, " ");
    str_append(stderr_buf, ctx->msg);
    str_append(stderr_buf, "\n");
    THROW_ABORT_IF(str_size(stderr_buf) != stderr_buf_size);

    write(STDERR_FILENO, stderr_buf, str_size(stderr_buf));

    str_delete(stderr_buf);
}

static unsigned long get_token_linenum(Ctx ctx, unsigned long total_linenum) {
    for (unsigned long i = 0; i < vec_size(ctx->fopen_lines) - 1; ++i) {
        if (total_linenum < ctx->fopen_lines[i + 1].total_linenum) {
            set_filename(ctx->fileio, ctx->fopen_lines[i].filename);
            return total_linenum - ctx->fopen_lines[i].total_linenum + ctx->fopen_lines[i].linenum;
        }
    }
    set_filename(ctx->fileio, vec_back(ctx->fopen_lines).filename);
    return total_linenum - vec_back(ctx->fopen_lines).total_linenum + vec_back(ctx->fopen_lines).linenum;
}

void raise_error_at_token(Ctx ctx, unsigned long info_at) {
    THROW_ABORT_IF(info_at >= vec_size(ctx->errors->token_infos));
    struct TokenInfo* token_info = &ctx->errors->token_infos[info_at];
    unsigned long tok_linenum = get_token_linenum(ctx, token_info->total_linenum);

    free_fileio(ctx->fileio);
    char* filename = get_filename(ctx->fileio);
    string_t line = str_new(NULL);
    {
        unsigned long len = 0;
        char* buf = NULL;
        struct FILE* fd = fopen(filename, "rb");
        if (!fd) {
            raise_base_error(ctx);
            return;
        }
        for (unsigned long i = 0; i < tok_linenum; ++i) {
            if (getline(&buf, &len, fd) == -1) {
                free(buf);
                fclose(fd);
                buf = NULL;
                fd = NULL;
                raise_base_error(ctx);
                return;
            }
        }
        line = str_new(buf);
        free(buf);
        fclose(fd);
        buf = NULL;
        fd = NULL;
        if (str_back(line) == '\n') {
            str_pop_back(line);
        }
    }
    if (ctx->is_stdout) {
        printf("%s", "\n");
        fflush(NULL);
    }
    {
        string_t tok_overline = str_new("");

        int tok_pos = 1;
        if (token_info->tok_pos >= 0) {
            tok_pos += token_info->tok_pos;
            if (token_info->tok_len > 1) {
                str_resize(tok_overline, token_info->tok_len - 1);
                for (unsigned long i = 0; i < str_size(tok_overline); ++i) {
                    tok_overline[i] = '~';
                }
            }
        }

        string_t pad_tok = str_new("");
        string_t pad_linenum = str_new("");
        string_t strto_pos = str_to_string(tok_pos);
        string_t strto_linenum = str_to_string(tok_linenum);

        str_resize(pad_tok, tok_pos - 1);
        for (unsigned long i = 0; i < str_size(pad_tok); ++i) {
            pad_tok[i] = ' ';
        }
        str_resize(pad_linenum, str_size(strto_linenum));
        for (unsigned long i = 0; i < str_size(pad_linenum); ++i) {
            pad_linenum[i] = ' ';
        }

        string_t stderr_buf = str_new("");
        unsigned long stderr_buf_size =
            strlen(":::\nerror: \nat line : v\n        | \n") + ESC_BOLD_SIZE + strlen(filename)
            + str_size(strto_linenum) + str_size(strto_pos) + ESC_RESET_SIZE + ESC_RED_SIZE + ESC_RESET_SIZE
            + strlen(ctx->msg) + str_size(strto_linenum) + ESC_RED_SIZE + str_size(pad_tok) + str_size(tok_overline)
            + ESC_RESET_SIZE + str_size(pad_linenum) + ESC_BOLD_SIZE + str_size(line) + ESC_RESET_SIZE;
        str_reserve(stderr_buf, stderr_buf_size);

        str_append(stderr_buf, esc_bold);
        str_append(stderr_buf, filename);
        str_append(stderr_buf, ":");
        str_append(stderr_buf, strto_linenum);
        str_append(stderr_buf, ":");
        str_append(stderr_buf, strto_pos);
        str_append(stderr_buf, ":");
        str_append(stderr_buf, esc_reset);
        str_append(stderr_buf, "\n");
        str_append(stderr_buf, esc_red);
        str_append(stderr_buf, "error:");
        str_append(stderr_buf, esc_reset);
        str_append(stderr_buf, " ");
        str_append(stderr_buf, ctx->msg);
        str_append(stderr_buf, "\n");
        str_append(stderr_buf, "at line ");
        str_append(stderr_buf, strto_linenum);
        str_append(stderr_buf, ": ");
        str_append(stderr_buf, esc_red);
        str_append(stderr_buf, pad_tok);
        str_append(stderr_buf, "v");
        str_append(stderr_buf, tok_overline);
        str_append(stderr_buf, esc_reset);
        str_append(stderr_buf, "\n");
        str_append(stderr_buf, "        ");
        str_append(stderr_buf, pad_linenum);
        str_append(stderr_buf, "| ");
        str_append(stderr_buf, esc_bold);
        str_append(stderr_buf, line);
        str_append(stderr_buf, esc_reset);
        str_append(stderr_buf, "\n");
        THROW_ABORT_IF(str_size(stderr_buf) != stderr_buf_size);

        write(STDERR_FILENO, stderr_buf, str_size(stderr_buf));

        str_delete(pad_tok);
        str_delete(pad_linenum);
        str_delete(strto_linenum);
        str_delete(strto_pos);
        str_delete(tok_overline);
        str_delete(stderr_buf);
    }
    str_delete(line);
}
