def f(s):
    return s.title()
l = ['adam', 'LISA', 'barT']
print map(f, l)

l = [1, 2, 3, 4]
def f(a, b):
    return a*b
print reduce(f, l)
