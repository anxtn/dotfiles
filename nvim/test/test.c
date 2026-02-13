#include <stdio.h>

#define MAX 10

typedef struct {
    int id;
    char name[20];
} Person;

enum Color { RED, GREEN, BLUE };

static int global_var = 0;

int add(int a, int b) { return a + b; }

int main(void) {
    Person p = {1, "Tom"};

    enum Color favorite = BLUE;

    for (int i = 0; i < MAX; i++) {
        printf("Hello %s! %d + %d = %d\n", p.name, i, global_var, add(i, global_var));
    }

    if (favorite == BLUE) {
        puts("Favorite color is blue.");
    } else {
        puts("Favorite color is not blue.");
    }

    return 0;
}
