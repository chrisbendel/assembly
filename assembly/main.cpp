#include <iostream>

using namespace std;

extern "C" void asmMain();

extern "C" double getDouble() {
    double d;
    cin >> d;
    return d;
}

extern "C" void printString(char* s) {
    cout << s;
    return;
}

extern "C" void printDouble(double d) {
    cout << d << endl;
}

int main() {
    asmMain();
    return 0;
}
