#include <iostream>
#include <string>
#include <vector>

template <typename T> T max(T a, T b) { return (a > b) ? a : b; }

class Animal {
  public:
    virtual void speak() const { std::cout << "Animal sound\n"; }
};

class Dog : public Animal {
  public:
    void speak() const override { std::cout << "Woof!\n"; }
};

int main() {
    std::vector<std::string> names = {"Alice", "Bob", "Charlie"};

    for (auto &name : names) {
        std::cout << "Hello " << name << std::endl;
    }

    Dog dog;
    dog.speak();

    std::cout << "Max of 3 and 7 is " << max(3, 7) << std::endl;

    return 0;
}
