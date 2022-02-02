#include <iostream>
#include <cmath>
#include <boost/iostreams/device/mapped_file.hpp>
using namespace std;
int main() {
    boost::iostreams::mapped_file_params params;
    params.path = "data.txt";
    params.new_file_size = 10; // 1 MB
    params.flags = boost::iostreams::mapped_file::mapmode::readwrite;
    boost::iostreams::mapped_file mf;
    mf.open(params);
    char* bytes = static_cast<char*>(mf.data());
    for (size_t i = 0; i < 10; ++i)
        bytes[i] = 'A' + i;
    cout << bytes << '\n';
    mf.close();
    return 0;
}