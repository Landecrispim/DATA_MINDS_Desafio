 --SELECT * FROM pessoa;

-- SELECT * FROM contratos;

 --SELECT * FROM pagamentos;

-- SELECT pessoa_cpf,AVG(valor) FROM pagamentos 
-- GROUP BY pessoa_cpf;

SELECT pessoa_cpf, COUNT(*) FROM contratos 
    WHERE modalidade = 'Parcelado'   
   GROUP BY pessoa_cpf;

--SELECT  pessoa_cpf, 
--        COUNT(DISTINCT contratos_numerounico),
--        (SELECT modalidade FROM contratos WHERE numerounico = contratos_numerounico) AS modalidade
--        FROM pagamentos
--        WHERE valorpagamento IS NULL 
--        GROUP BY pessoa_cpf;

        


SELECT pessoa_cpf, COUNT(*)
FROM  contratos
WHERE numerounico IN (SELECT DISTINCT contratos_numerounico
                     FROM pagamentos
                     WHERE valorpagamento IS NULL
                     AND datavencimento < now()
                     )
      AND modalidade = 'Parcelado'
GROUP BY pessoa_cpf
;

SELECT pessoa_cpf, ROUND(AVG(valor),2)
FROM pagamentos 
WHERE contratos_numerounico IN (SELECT DISTINCT numerounico
                                FROM contratos
                                WHERE modalidade = 'Parcelado')
     AND valorpagamento IS NULL
     AND datavencimento < now()
GROUP BY pessoa_cpf
;


