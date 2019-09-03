# TODO: Handle MS Window and GNU/Linux differences

dir=File.expand_path(File.dirname(__FILE__))

c_src = [
    dir + "/../c_lib/print.c"
]

cpp_src = [
    dir + "/../cpp_app/main.cpp"
]

flags = ""

if ARGV[0] == "Debug"
    flags = "-O0 -g"
elsif ARGV[0] == "Release"
    flags = "-O3 -march=native -funroll-loops"
else 
    puts "Error: Debug or Release must be passed!"
    exit(1)
end

flags = flags + " -Werror -Wall -Wextra"

CC = "gcc"
CXX = "g++"

CFLAGS = "-std=c99 " + flags
CXXFLAGS = "-std=c++17 -I" + dir + "/../c_lib " + flags

system("rm -f " + dir + "/../*.o")
system("rm -f " + dir + "/../libprint.a")
system("rm -f " + dir + "/../executable")

c_src.each do |src|
    system(CC + " " + CFLAGS + " -c " + src)
end

system("ar rcs libprint.a print.o")

cpp_src.each do |src|
    system(CXX + " " + CXXFLAGS + " -c " + src)
end

system(CXX + " " + CXXFLAGS + " -o executable main.o libprint.a")
