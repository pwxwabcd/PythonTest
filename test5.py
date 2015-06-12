
def fact(n):
    return fact_iter(1, 1, n)

@tail_call_optimized
def fact_iter(product, count, max):
    if count > max:
        return product
    return fact_iter(product * count, count + 1, max)

print fact(1000)