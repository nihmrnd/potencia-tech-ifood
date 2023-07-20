def main():
    n = int(input())
    total = 0
 
    for i in range(1, n + 1):
        pedido = input().split(" ")
        valor = float(pedido[1])
        total += valor
        
    cupom = int(input().rstrip('%'))
    valor_com_cupom = total * (cupom / 100)
    valor_total_itens = total - valor_com_cupom
    print(f'Valor total: {valor_total_itens:.2f}')
    
      
if __name__ == "__main__":
    main()