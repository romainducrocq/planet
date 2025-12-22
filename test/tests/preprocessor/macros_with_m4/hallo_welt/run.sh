#!/bin/bash

planet -E -Ibibliothek/ -Ibibliothek/schnittstelle/ haupt.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./haupt
if [ ${?} -ne 0 ]; then exit 1; fi

./haupt 42
if [ ${?} -ne 42 ]; then exit 1; fi

planet -E -DProgrammierschnittstelle \
    -DStandardEA=stdio -DStandardBib=stdlib \
    -DGanz=i32 -DZeichenkette=string -Dnichtig=nil \
    -Dbenutze=use -Doffentlich=pub -DFunktion=fn -Dwenn=if -Dzuruck=return \
    -Ibibliothek/ -Ibibliothek/schnittstelle/ haupt.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./haupt
if [ ${?} -ne 0 ]; then exit 1; fi

./haupt 42
if [ ${?} -ne 42 ]; then exit 1; fi

# TODO check stdout for "Hallo Welt!\n"
# compile without includes and check if haupt.i exist
# compile with -S and check if .s and .i exits
