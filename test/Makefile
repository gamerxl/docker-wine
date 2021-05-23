# Builds a simple test application.

# Default
all: clean build

clean:
	@echo "Clean previous build."
	@rm -f test.exe

build:
	@echo "Build application."
	@i686-w64-mingw32-g++-win32 -mconsole -static test.cpp -o test.exe
