import math

def is_square(x):
    return math.sqrt(x) == 0

def main():
    arr = []
    for i in range (1,1000000):
        val = int(f'{i}{i}')
        is_sqrt = is_square(val)
        if is_sqrt:
            arr.append((i, val))
    return arr

if __name__ == '__main__':
    is_div = main()
    print(is_div)