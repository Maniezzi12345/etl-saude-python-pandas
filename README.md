# Análise de Saúde — Python + Pandas

Pipeline de análise de dados clínicos com Python e Pandas explorando consultas médicas e perfil de pacientes.

## Stack
- Python 3.12+
- Pandas
- Jupyter Notebook

## Como rodar

```bash
pip install pandas jupyter
jupyter notebook notebooks/analise.ipynb
```

## O que foi desenvolvido
- 11 análises combinando SQL e Pandas
- Filtros simples e múltiplos com WHERE e AND
- Agrupamentos com GROUP BY, COUNT, SUM e AVG
- JOINs entre tabelas de pacientes e consultas
- Filtros encadeados com lambda no Pandas
- Ordenação e seleção de colunas

## Estrutura
```
projeto-saude/
├── dados/
│   ├── pacientes.py
│   └── consultas.py
├── notebooks/
│   └── analise.ipynb
├── pipeline/
│   └── transformar.py
├── .gitignore
└── README.md
```