# Python boolean
# True | False

a = 5
b = 0

print(a & b) #0101 & 0000 => 0000
print(bool(a&b)) # False

print('bool(1,2,3)', bool((1,2,3))) # True
temp = {}
print('temp {}', bool(temp))  # False
print('bool not', bool(not 0)) # True

trueFlag =True
falseFlag=False
print(int(trueFlag))  # 1
print(int(falseFlag))  # 0

print(trueFlag & falseFlag)   # False
print(trueFlag | falseFlag)   # True

print(trueFlag and falseFlag)   # False
print(trueFlag or falseFlag)   # True
print(not trueFlag)   # False