def __virtual__():
    return 'big_payload'

def call(count: int, size: int):
    return ["a" * size] * count

if __name__ == "__main__":
    print(call(10, 100))
