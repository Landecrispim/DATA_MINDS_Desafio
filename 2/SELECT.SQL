SELECT * FROM pessoa;

SELECT * FROM contratos;

SELECT * FROM pagamentos;

SELECT pessoa_cpf,AVG(valor) FROM pagamentos 
GROUP BY pessoa_cpf;

SELECT pessoa_cpf, COUNT(*) FROM contratos 
    WHERE modalidade = 'Parcelado'   
    GROUP BY pessoa_cpf;

SELECT pessoa_cpf, COUNT(*) FROM contratos 
    WHERE modalidade = 'Parcelado'   
    GROUP BY pessoa_cpf;
