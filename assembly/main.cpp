#include <stdio.h>
#include <iostream>

using namespace std;

extern "C" void asmMain();

extern "C" void test() {
    cout << "Hello" << endl;
}

extern "C" int getNum() {
    int num;
    cout << "Enter a number to add: ";
    cin >> num;
    return num;
}

int main() {
    asmMain();
    return 0;
}
