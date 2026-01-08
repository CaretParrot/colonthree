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
            char tokens[10];
            char *ptr = strtok(inputLine, " ");
            while (ptr != NULL) {
                printf("%s\n", ptr);
                if (strcmp(ptr, "🖨️")) {
                    ptr = strtok(NULL, " ");
                    printf("%s", ptr);
                }
                ptr = strtok(NULL, " ");
            }
        }
    }

    return 0;
}