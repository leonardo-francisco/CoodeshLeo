--1 LISTAR TODOS OS CLIENTES QUE NÃO TENHAM REALIZADO UMA COMPRA
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL

--2 LISTAR OS PRODUTOS QUE NÃO TENHAM SIDO COMPRADOS
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL

--3 LISTAR OS PRODUTOS SEM ESTOQUE
SELECT p.*
FROM products p
LEFT JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity IS NULL OR s.quantity = 0

--4 AGRUPAR A QUANTIDADE DE VENDAS DE UMA DETERMINADA MARCA POR LOJA
SELECT b.brand_id, b.brand_name, s.store_id, SUM(oi.quantity) AS total_vendas
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY b.brand_id, b.brand_name, s.store_id

--5 LISTAR OS FUNCIONARIOS QUE NÃO ESTEJAM RELACIONADOS A UM PEDIDO
SELECT s.*
FROM staffs s
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.staff_id IS NULL