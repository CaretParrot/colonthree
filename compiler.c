#define MAX_CHAR_LIMIT (100)
#define MAX_PARAM_LIMIT (100)
#include <stdio.h>
#include <string.h>

char g_line[MAX_PARAM_LIMIT][MAX_CHAR_LIMIT];

void evaluate() {
    if (strcmp(g_line[0], ":D")) {
        printf("%s", g_line[0]);
    }
}

void copy_cell(char string[], int entry)
{
    int j = 0;
    for (j = 0; j < strlen(string); j++)
    {
        g_line[entry][j] = string[j];
    }
    g_line[entry][j + 1] = '\0';
}

void split(char input[])
{
    int i = 0;
    char *stringPtr = strtok(input, "  ");
    while (stringPtr != NULL && i < MAX_PARAM_LIMIT)
    {
        copy_cell(stringPtr, i);
        evaluate();
        stringPtr = strtok(NULL, "  ");
        i++;
    }
}

int main()
{
    FILE *fptr;
    char line[100];

    fptr = fopen("main.col3", "r");

    if (fptr == NULL)
    {
        printf("File could not be opened.");
        return -1;
    }

    while (fgets(line, 100, fptr))
    {
        split(line);
    }

    fclose(fptr);
}