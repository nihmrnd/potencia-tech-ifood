valorHambuger = float(input())
quantidadeHamburger = int(input())
valorBebida = float(input())
quantidadeBebida = int(input())
valorPago = float(input())

valorTotalPedido = (valorHambuger * quantidadeHamburger) + (valorBebida * quantidadeBebida)
troco = valorPago - valorTotalPedido

print(f'O preço final do pedido é R$ {valorTotalPedido:.2f}. Seu troco é R$ {troco:.2f}.')