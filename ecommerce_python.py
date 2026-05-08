import pyodbc

# ============================================
# CONEXÃO COM O BANCO DE DADOS
# ============================================

dados_conexão = (
    'Driver={ODBC Driver 18 for SQL Server};'
    'Server=(local)\\SQLEXPRESS;'
    'Database=PYTHONSQL;'
    'Trusted_Connection=yes;'
    'TrustServerCertificate=yes;'
)

conexão = pyodbc.connect(dados_conexão)
print('✅ Conexão bem sucedida!')
cursor = conexão.cursor()


# ============================================
# INSERIR CLIENTE
# ============================================

def inserir_cliente(nome, email, telefone, cidade):
    comando = f"""INSERT INTO TBL_CLIENTES (nome, email, telefone, cidade)
    VALUES ('{nome}', '{email}', '{telefone}', '{cidade}')"""
    cursor.execute(comando)
    conexão.commit()
    print(f'✅ Cliente "{nome}" inserido com sucesso!')


# ============================================
# INSERIR PRODUTO
# ============================================

def inserir_produto(nome_produto, categoria, preco, estoque):
    comando = f"""INSERT INTO TBL_PRODUTOS (nome_produto, categoria, preco, estoque)
    VALUES ('{nome_produto}', '{categoria}', {preco}, {estoque})"""
    cursor.execute(comando)
    conexão.commit()
    print(f'✅ Produto "{nome_produto}" inserido com sucesso!')


# ============================================
# INSERIR VENDA
# ============================================

def inserir_venda(id_cliente, id_produto, quantidade, valor_total, data_venda):
    comando = f"""INSERT INTO TBL_VENDAS (id_cliente, id_produto, quantidade, valor_total, data_venda)
    VALUES ({id_cliente}, {id_produto}, {quantidade}, {valor_total}, '{data_venda}')"""
    cursor.execute(comando)
    conexão.commit()
    print(f'✅ Venda inserida com sucesso!')


# ============================================
# EXEMPLOS DE USO
# ============================================

inserir_cliente('Pedro Alves', 'pedro@email.com', '21-99999-0001', 'Rio de Janeiro')
inserir_produto('Webcam HD', 'Informática', 250.00, 20)
inserir_venda(1, 1, 1, 250.00, '2026-05-07')


# ============================================
# FECHAR CONEXÃO
# ============================================

cursor.close()
conexão.close()
print('🔒 Conexão encerrada.')
