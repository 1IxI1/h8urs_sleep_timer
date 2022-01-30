with open('lib/main.dart', 'r') as f:
    data = f.readlines()

for i in range(108, 157, 7):
    currline = data[i]
    ind = currline.index(':') + 2
    n = round(393/int(currline[ind:ind+2]), 2)
    data[i] = currline[:ind]+'w / ' + str(n) + currline[ind+2:]

with open('lib/main.dart', 'w') as f:
    f.writelines(data)
