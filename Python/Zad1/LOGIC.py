import re
def replace_str(text,index=0,replacement=''):
    return '%s%s%s'%(text[:index],replacement,text[index+1:])

Variables = set()
Expression = []

def CreateTable(expr):
    Table = []
    global Variables
    Variables = list(Variables)
    for i in range(0, 2**len(Variables)):
        Stack = []
        for c in expr:
            if c in Variables:
                Stack.append(((1<<(len(Variables)-Variables.index(c)-1)) & i) and 1)
            elif c == "1":
                Stack.append(1)
            elif c == "0":
                Stack.append(0)
            elif c == "|": #OR
                b = Stack.pop()
                a = Stack.pop()
                Stack.append(a or b)
            elif c == "&": #AND
                b = Stack.pop()
                a = Stack.pop()
                Stack.append(a and b)
            elif c == "~": #NEG
                a = Stack.pop()
                if a == 1:
                    a = 0
                else:
                    a = 1
                Stack.append(a)
            elif c == ">": #impl
                b = Stack.pop()
                a = Stack.pop()
                if b == 0 and a == 1:
                    Stack.append(0)
                else:
                    Stack.append(1)
            elif c == "=": #rown
                b = Stack.pop()
                a = Stack.pop()
                if a == b:
                    Stack.append(1)
                else:
                    Stack.append(0)
            elif c == "*": #XOR
                b = Stack.pop()
                a = Stack.pop()
                if a == b:
                    Stack.append(0)
                else:
                    Stack.append(1)
            else:
                raise ValueError("Expression table not correct!")
        if Stack.pop() == 1:
            Table.append(i)
    return Table

def TransformTo01(table):
    Table2 = []
    for elem in table:
        s = []
        for i in range(0, len(Variables)):
            if elem % 2 == 0:
                s.insert(0, "0")
            else:
                s.insert(0, "1")
            elem //= 2
        st = ''.join(x for x in s)
        Table2.append(st)
    return Table2

def CanMerge(s1, s2):
    diff = False
    place = 0
    for i,c in enumerate(s1):
        if s1[i] != s2[i]:
            if s1[i] == "X" or s2[i] == "X":
                return -1
            elif diff == False:
                place = i
                diff = True
            else:
                return -1
    return place

def Reduce(table):
    nextStep = False
    notUsed = set(table)
    newTable = []
    for i,val1 in enumerate(table):
        for j,val2 in enumerate(table):
            if i == j:
                continue
            p = CanMerge(val1, val2)
            if p != -1:
                nextStep = True
                newTable.append(replace_str(val1, p, "X"))
                if val1 in notUsed:
                    notUsed.remove(val1)
                if val2 in notUsed:
                    notUsed.remove(val2)
    if nextStep == True:
        return Reduce(set(newTable).union(notUsed))
    else:
        return set(newTable).union(notUsed)

def PrintResult(table):
    if len(table) == 0: #check if result is 1 or 0
        print(0)
        return
    if len(table) == 1:
        AllX = True
        for c in list(table)[0]:
            if c != "X":
                AllX = False
        if AllX == True:
            print(1)
            return
    First = True
    for elem in table:
        if First == False:
            print(" + ", end='')
        for i,c in enumerate(elem):
            if c == "X":
                continue
            if c == "0":
                print("~", end='')
            print(Variables[i], end='')
        First = False
    print("")


def ONP(expr, i, d):
    Stack = []
    var = expr[i]
    if re.search('[a-zA-Z]', var) != None: #value is variable
        Variables.add(var)
        return [var]
    elif var == "0" or var == "1":
        return [var]
    elif var == "~":
        Stack = ONP(expr, i+1, d+1)
        Stack.append(var)
        return Stack
    if var == "(":
        i += 1
        App = ONP(expr, i, d+1)
        Stack += App
        numOfOps = 0
        for x in App:
            if x in Variables or x == "0" or x == "1" or x == "~":
                numOfOps += 1
            else:
                numOfOps += 3
        i += (numOfOps)
        op = expr[i]
        i += 1
        App2 = ONP(expr, i, d+1)
        Stack += App2
        Stack += op
        return Stack
    raise ValueError("Bad input!")
    return 0

def Logic(expr):
    global Variables
    global Expresssion
    Variables = set()
    Expression = []
    e = re.findall(r"[\w']+|[&|~)(*=>]", expr)
    e = ONP(e, 0, 0)
    e = CreateTable(e)
    e = TransformTo01(e)
    e = Reduce(e)
    PrintResult(e)

    
#| - OR
#& - AND
#~ - NEGATION
#= - EQUIVALENCE
#> - IMPLICATION
#* - XOR
Logic("aaa")
Logic("(a | 1)")
Logic("(a & 0)")
Logic("~(0 & p)")
Logic("(a * b)")
Logic("((((a | b) & c) = dd) > e)")   
Logic("(((p & q) | (zzz & q)) & p)")
Logic("(((p | q) > r) = ~((p > r) | (q > r)))")
Logic("(((p|q)>r)=~((p>r)|(q>r)))")
Logic("0")
Logic("1")