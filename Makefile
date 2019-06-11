ASM = nasm
FLAGS = -f elf64 -g -I
LINKER = ld

SOURCES = forthress.asm
INCS = util.inc words.inc macro.inc
OBJECTS = obj/forthress.o

EXECUTABLE = forthress

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
    $(LINKER) $(OBJECTS) -o $@

$(OBJECTS): $(SOURCES) $(INCS)
    mkdir -p obj
    $(ASM) $(FLAGS) $(SOURCES)  -o $@

clean:
    rm -rf obj/
    rm $(EXECUTABLE)