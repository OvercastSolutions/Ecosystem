TARGET = bin/main

LIBS = cryptopp


CXX = g++ -std=c++11
SRCDIR = src
BUILDDIR = build
TGTDIR = bin
SRCEXT = cpp
INC = -I include
FLAGS = -g -Wall
LIB = $(foreach lib, $(LIBS), $(wildcard lib/$(lib)/*.a) )

SOURCES = $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS = $(patsubst $(SRCDIR)/%, $(BUILDDIR)/%, $(SOURCES:.$(SRCEXT)=.o))



$(TARGET): $(OBJECTS)
	@echo " Linking ..."
	@echo "$(CXX) $^ $(LIB) -o $(TARGET)"; $(CXX) $^ $(LIB) -o $(TARGET)


$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	$(CXX) $(FLAGS) $(INC) -c -o $@ $<


.PHONY: clean
clean:
	@echo "Cleaning ..."
	$(RM) bin/* build/*
