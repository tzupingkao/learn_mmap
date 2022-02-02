#include <iostream>
#include <cmath>
#include <boost/iostreams/device/mapped_file.hpp>
using namespace std;
int main() {
    boost::iostreams::mapped_file_params params;
    params.path = "tt2.txt";
    //params.length = 512; // default: complete file
    // params.new_file_size = 10; // 1 MB
    params.flags = boost::iostreams::mapped_file::mapmode::readonly;
    boost::iostreams::mapped_file mf;
    mf.open(params);
    const char* bytes = mf.const_data();
    cout << bytes << '\n';
    cout << bytes[0] << '\n';
    mf.close();
    return 0;
}