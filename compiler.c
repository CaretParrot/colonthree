#include <stdio.h>
#include <string.h>

int main()
{
    FILE *fptr;

    fptr = fopen("test.col3", "r");
    char inputLine[100];

    if (fptr == NULL) {
        printf("Could not read file.");
    } else {
        while (fgets(inputLine, 100, fptr)) {
            char command[9];
            strncpy(command, inputLine, 8);
            strcat(command, "\0");
            if (strcmp(command, "🖨️")) {
                printf("%s", command);
            }
        }
    }

    return 0;
}