WORKDIR = %cd%

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC = 
CFLAGS = 
RESINC = 
LIBDIR = 
LIB = 
LDFLAGS=

INC_RELEASE = $(INC)
CFLAGS_RELEASE = $(CFLAGS) -Wall -O2
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(LIB)
LDFLAGS_RELEASE = $(LDFLAGS) -s
OBJDIR_RELEASE = bin
DEP_RELEASE =
OUT_RELEASE = lib/libzio-utils.a
SRC_RELEASE = src

OBJ_RELEASE = $(OBJDIR_RELEASE)/con_interaction.o $(OBJDIR_RELEASE)/reader.o $(OBJDIR_RELEASE)/list.o 

all: release

clean: clean_release

before_release:	
	mkdir -p $(OBJDIR_RELEASE)
	mkdir -p lib

after_release: 

release: before_release out_release after_release

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(AR) rcs $(OUT_RELEASE) $(OBJ_RELEASE)

$(OBJDIR_RELEASE)/con_interaction.o: $(SRC_RELEASE)/con_interaction.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c $(SRC_RELEASE)/con_interaction.c -o $(OBJDIR_RELEASE)/con_interaction.o

$(OBJDIR_RELEASE)/reader.o: $(SRC_RELEASE)/reader.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c $(SRC_RELEASE)/reader.c -o $(OBJDIR_RELEASE)/reader.o

$(OBJDIR_RELEASE)/list.o: $(SRC_RELEASE)/list.c
	$(CC) $(CFLAGS_RELEASE) $(INC_RELEASE) -c $(SRC_RELEASE)/list.c -o $(OBJDIR_RELEASE)/list.o

clean_release: 
	rm -rf $(OBJDIR_RELEASE)
	rm -rf lib

.PHONY: before_release after_release clean_release

