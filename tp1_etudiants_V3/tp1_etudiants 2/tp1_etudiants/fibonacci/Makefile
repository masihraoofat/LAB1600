CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic -Werror -Wunused-variable -g -O2
SRC = main.c
# Executable name
EXEC = exec
all:
	$(CC) $(CFLAGS) $(SRC) -o $(EXEC)
	
	@echo 
	./$(EXEC)
	@echo

# Clean target to remove object files and executable
clean:
	rm -f $(EXEC)
