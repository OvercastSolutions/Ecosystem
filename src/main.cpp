
#include "cryptopp/cryptlib.h"
#include "cryptopp/sha.h"

#include "unid.hpp"

#include<iostream>
using namespace std;


int main() {
  string msg;
  cout << "MSG: ";
  cin >> msg;
  cout << endl;
  string id = unid(msg);
  cout << id << endl;
  return 0;
}

