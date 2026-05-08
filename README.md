# 🛒 Sistema de Vendas / E-commerce — SQL Server + Python

Projeto de banco de dados relacional para gerenciamento de vendas, desenvolvido com SQL Server e Python.

---

## 📁 Arquivos

| Arquivo | Descrição |
|---|---|
| `ecommerce_projeto.sql` | Criação das tabelas, inserção de dados e consultas |
| `ecommerce_python.py` | Conexão Python + funções de inserção |

---

## 🗄️ Estrutura do Banco de Dados

### TBL_CLIENTES
| Coluna | Tipo | Descrição |
|---|---|---|
| id_cliente | INT (PK) | Identificador único |
| nome | VARCHAR(100) | Nome do cliente |
| email | VARCHAR(100) | Email |
| telefone | VARCHAR(20) | Telefone |
| cidade | VARCHAR(50) | Cidade |
| data_cadastro | DATE | Data de cadastro |

### TBL_PRODUTOS
| Coluna | Tipo | Descrição |
|---|---|---|
| id_produto | INT (PK) | Identificador único |
| nome_produto | VARCHAR(100) | Nome do produto |
| categoria | VARCHAR(50) | Categoria |
| preco | DECIMAL(10,2) | Preço |
| estoque | INT | Quantidade em estoque |

### TBL_VENDAS
| Coluna | Tipo | Descrição |
|---|---|---|
| id_venda | INT (PK) | Identificador único |
| id_cliente | INT (FK) | Referência ao cliente |
| id_produto | INT (FK) | Referência ao produto |
| quantidade | INT | Quantidade vendida |
| valor_total | DECIMAL(10,2) | Valor total da venda |
| data_venda | DATE | Data da venda |

---

## ⚙️ Como Executar

### SQL Server (SSMS)
1. Abra o SSMS e conecte ao servidor
2. Abra o arquivo `ecommerce_projeto.sql`
3. Execute com **F5**

### Python
1. Instale as dependências:
```bash
pip install pyodbc
```
2. Execute o script:
```bash
python ecommerce_python.py
```

---

## 🔧 Requisitos
- SQL Server Express
- Python 3.x
- ODBC Driver 18 for SQL Server
- pyodbc
