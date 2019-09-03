#include <iostream>
#include <string>
#include <print.h>

int main()
{
    const std::string str{"test"};
    std::cout << "C++ here: \"" << str << "\"!\n";
    print(str.data());
}
