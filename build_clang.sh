mkdir ~/clang_src
cd ~/clang_src
svn co http://llvm.org/svn/llvm-project/llvm/tags/RELEASE_390/final llvm_RELEASE_390
cd llvm_RELEASE_390/tools
svn co http://llvm.org/svn/llvm-project/cfe/tags/RELEASE_390/final clang
cd ../projects
svn co http://llvm.org/svn/llvm-project/compiler-rt/tags/RELEASE_390/final compiler-rt
svn co http://llvm.org/svn/llvm-project/libcxx/tags/RELEASE_390/final libcxx
svn co http://llvm.org/svn/llvm-project/libcxxabi/tags/RELEASE_390/final libcxxabi
cd ..
svn update
mkdir ../llvm_RELEASE_390_build
cd ../llvm_RELEASE_390_build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=OFF -DCMAKE_C_COMPILER=/usr/local/bin/gcc -DCMAKE_CXX_COMPILER=/usr/local/bin/g++ ../llvm_RELEASE_390 && make && sudo make install && echo success
echo "/usr/local/lib" > usrLocalLib.conf
sudo mv usrLocalLib.conf /etc/ld.so.conf.d/
sudo ldconfig
