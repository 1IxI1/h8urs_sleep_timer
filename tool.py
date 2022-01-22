f = open('lib/main.dart', 'r')
data = f.readlines()
for i in range(31, 80, 7):
    currline = data[i]
    ind = currline.index(':') + 2
    n = currline[ind:ind+2]
    print(n)
#    print(currline[:ind]+'w/')
#    data[i] = currline[:ind] +
