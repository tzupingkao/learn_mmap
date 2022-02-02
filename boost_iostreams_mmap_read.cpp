#include <boost/iostreams/device/mapped_file.hpp>
#include <iostream>
 
int main() {
 
    boost::iostreams::mapped_file_source file;
    int numberOfElements = 10;
    int numberOfBytes = numberOfElements*sizeof(char);
    file.open("tt.txt", numberOfBytes);
 
    // Check if file was successfully opened
    if(file.is_open()) {
        // Get pointer to the data
        char * data = (char *)file.data();
 
        // Do something with the data
        for(int i = 0; i < numberOfElements; i++)
            std::cout << data[i] << " ";
 
        // Remember to unmap the file
        file.close();
    } else {
        std::cout << "could not map the file filename.raw" << std::endl;
    }
}
