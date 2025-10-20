#ifndef _TRANSPILER_H_
#define _TRANSPILER_H_

#include <string>
#include <unordered_map>
#include <vector>

namespace cc {

class Transpiler {
    private:
        std::unordered_map<size_t, std::string> buffer_lines;
        std::vector<std::string> lines;

    public:
        Transpiler() = default;
        ~Transpiler() = default;

        void add_buffer_line(size_t at, const std::string& line);
        void append_text(const std::string& text);
};

}

extern cc::Transpiler transpiler;

#endif
