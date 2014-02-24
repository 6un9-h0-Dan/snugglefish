#Approved for Public Release; Distribution Unlimited: 13-1937

# Copyright (c) 2014 The MITRE Corporation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

CC=g++

all: snugglefish

snugglefish: snugglefish.o nGramBase.o nGramSearch.o nGramIndex.o fileIndexer.o files
	${CC} -rdynamic -pthread snugglefish.o nGramBase.o nGramSearch.o nGramIndex.o fileIndexer.o file.o indexSet.o smFile.o  -o snugglefish

snugglefish.o: src/snugglefish.cpp
	${CC} -Iinclude -g -c src/snugglefish.cpp

nGramBase.o: src/nGramBase.cpp
	${CC} -Iinclude -g -c src/nGramBase.cpp

nGramIndex.o: src/nGramIndex.cpp src/nGramBase.cpp
	${CC} -Iinclude -g -c src/nGramIndex.cpp

nGramSearch.o: src/nGramSearch.cpp src/nGramBase.cpp
	${CC} -Iinclude -g -c src/nGramSearch.cpp

fileIndexer.o: src/fileIndexer.cpp
	${CC} -Iinclude -g -c src/fileIndexer.cpp

files: src/file.cpp src/indexSet.cpp src/smFile.cpp
	${CC} -Iinclude -g -c src/file.cpp
	${CC} -Iinclude -g -c src/indexSet.cpp
	${CC} -Iinclude -g -c src/smFile.cpp

clean: 
	rm -rf *.o snugglefish

