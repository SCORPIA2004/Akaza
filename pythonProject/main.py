# read a text file into a string variable

# open file
f = open("test.txt", "r")

# read file into string variable
s = f.read()

# remove all newline and tab characters
s = s.replace("\n", "")
s = s.replace("\t", "")

print(s);

# close file
f.close()
