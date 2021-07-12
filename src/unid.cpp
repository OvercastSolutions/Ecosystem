#include "unid.hpp"

#include "cryptopp/cryptlib.h"
#include "cryptopp/sha.h"
#include "cryptopp/filters.h"
#include "cryptopp/hex.h"

using namespace CryptoPP;

#include <iostream>


string unid(const string str) {
  SHA256 hash;
  string digest;
  StringSource str_src(str, true, new HashFilter(hash, new HexEncoder(new StringSink(digest))));
  return digest;
}

string unid(const char* chary, size_t size) {
  string str(chary, size);
  return unid(str);
}








