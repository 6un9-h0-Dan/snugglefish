/*
 Approved for Public Release; Distribution Unlimited: 13-1937
 
 Copyright (c) 2014 The MITRE Corporation. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.
 
 */

#ifndef SNUGGLEFISH_H
#define SNUGGLEFISH_H

#include <string>
#include <vector>
#include <stdint.h>
#include <pthread.h>

typedef struct _mi_data{
    std::vector <std::string>* fileList;
    uint32_t queue;
    void* ngramindex;
    
    uint32_t ngramSize;

    pthread_mutex_t filesMutex;
    pthread_mutex_t nGramIndexMutex;
        

} mi_data;

#ifdef __cplusplus
extern "C" {
#endif


    void make_index(std::string indexFileName, std::vector <std::string> fileNames, uint32_t ngramSize, uint32_t max_files, uint64_t max_buffer, uint32_t threads);

#ifdef __cplusplus
}
#endif

std::vector<std::string>* search(std::string indexFileName, std::string searchString, uint32_t ngramSize, uint32_t threads);
    
#endif
