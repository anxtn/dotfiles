from typing import List, Optional


class User:
    def __init__(self, name: str, age: int) -> None:
        self.name = name
        self.age = age

    def greet(self) -> str:
        return f"Hello, my name is {self.name} and I am {self.age} years old."


def find_user_by_name(users: List[User], name: str) -> Optional[User]:
    for u in users:
        if u.name == name:
            return u
    return None


def main() -> None:
    users = [
        User("Tom", 25),
        User("Lisa", 30),
        User("Max", 22),
    ]

    tom = find_user_by_name(users, "Tom")
    if tom is not None:
        print(tom.greet())

if __name__ == "__main__":
    main()
