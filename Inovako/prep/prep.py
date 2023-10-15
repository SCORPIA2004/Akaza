def reverse(arr):
    arrSize = len(arr)
    midpoint = arrSize // 2
    print("Size of midpoint arr: " + str(midpoint))

    for i in range(arrSize // 2):
        temp = arr[i]
        arr[i] = arr[arrSize - i - 1]
        arr[arrSize - i - 1] = temp

if __name__ == '__main__':

    # n = 7
    # d = 2
    # r = n
    # q = 0
    #
    # while r >= d:
    #     r = r - d
    #     q = q + 1
    #
    # print("quotient = " + str(q))
    # print("remainder = " + str(r))


    b = 16
    c = 1
    d = 30

    print("b / c = ", b / c)
    print("d % b = ", d % b)
    print("b / c + d % b = ", b / c + d % b)
    print("(b / c + d % b - c) = ", b / c + d % b - c)
    a = (b / c + d % b - c) / b

    print(a)



    # arr = [0, 1, 2, 3,4]
    # print(arr)
    # reverse(arr)
    # print(arr)

