#ifndef _TRANSPILER_H_
#define _TRANSPILER_H_

namespace cc {

class Transpiler {

    public:
        Transpiler() = default;
        ~Transpiler() = default;

        void Hello();
};

extern Transpiler transpiler;

}

#endif
