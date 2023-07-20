numPedidos = int(input())

for i in range(1, numPedidos + 1):
    prato = input()
    calorias = int(input())
    ehVegano = input()
    if 's'== ehVegano:
      ehVegano = True
      ehVegano = 'Vegano'
    elif 'n' == ehVegano:
      ehVegano = False
      ehVegano = 'Nao-vegano'
    print(f'Pedido {i}: {prato} ({ehVegano}) - {calorias} calorias')