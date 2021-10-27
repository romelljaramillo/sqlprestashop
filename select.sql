
SELECT 
	p.id_product,
	p.reference,
	'' AS GA_ID,
	pl.name,
	fl.name AS brand,
	cl.name AS categories,
	ROUND(p.price,2) AS price,
	'' AS variationPrice,
	21 AS VAT,
	ROUND(p.price,2) AS shippingPrice,
	''AS minimumAllowedPrice,
	'' AS maximumAllowedPrice,
	p.state,
	p.date_add,
	'' AS substitutionProducts,
	1 AS IAactive
FROM ps_product p
INNER JOIN ps_product_lang pl ON p.id_product = pl.id_product
INNER JOIN ps_category_product cp ON p.id_product = cp.id_product
INNER JOIN ps_category c ON cp.id_category = c.id_category
INNER JOIN ps_category_lang cl ON cp.id_category = cl.id_category
INNER JOIN ps_feature_product fp ON p.id_product = fp.id_product
INNER JOIN ps_feature_lang fl ON fp.id_feature = fl.id_feature
WHERE pl.id_lang = 1 AND p.active = 1 AND c.active = 1
GROUP BY  p.id_product, p.reference,  pl.name,  brand, categories,  p.price,
variationPrice, VAT, shippingPrice, minimumAllowedPrice, maximumAllowedPrice,
p.state, p.date_add, substitutionProducts, IAactive;



SELECT 
o.id_order,
od.id_order_detail,
od.product_id,
od.product_name
FROM ps_orders o
LEFT JOIN ps_order_detail od ON o.id_order = od.id_order
