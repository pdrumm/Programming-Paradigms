list = ["apple", "orange", "banana", "cake", "pie", "pizza"]

print "2nd item in the list is: " + list[1]
print "3rd item til end: " + str(list[2:])
print "middle of it: " + str(list[1:3])

print "// append"
list.append("peppers")
print list

print "// pop"
list.pop(-1)
print list

print "// remove"
list.remove("banana")
print list

list[0]="// banana"
print list

print "// insert"
orange_index=list.index("orange")
list.insert(orange_index,"olives")
print list

count=0
for n in list:
	count += 1
print count
