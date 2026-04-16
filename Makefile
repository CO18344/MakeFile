# .PHONY declares targets that don't represent actual files
# These targets always run their recipes regardless of file existence
.PHONY: all clean

# 'all' is the default target (runs when you call 'make' with no arguments)
# DEPENDENCY: depends on 'app' target
# This ensures the main application is built
all: app

# 'app' is the main executable target
# DEPENDENCIES: main.o and math_utils.o object files
# These object files must be built/updated before linking them together
app: main.o math_utils.o 
	gcc main.o math_utils.o -o app 

# 'main.o' object file target
# DEPENDENCIES: main.c source file and math_utils.h header file
# main.o is rebuilt if either main.c or math_utils.h is modified
main.o: main.c math_utils.h
	gcc -c main.c 

# 'math_utils.o' object file target
# DEPENDENCY: math_utils.c source file
# math_utils.o is rebuilt if math_utils.c is modified
math_utils.o: math_utils.c
	gcc -c math_utils.c

# 'clean' is a PHONY target (not a real file)
# Removes all build artifacts (object files and executable)
# Run with: make clean
clean: 
	rm -f *.o app