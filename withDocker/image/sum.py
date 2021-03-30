import sys

def main():
    arg = sys.argv[1]
    values = [int(x) for x in arg.strip().split(',')]
    total = 0
    for v in values:
        total += v
    print(total)
    return total

if __name__ == '__main__':
    main()
