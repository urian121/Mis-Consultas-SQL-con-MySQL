use empresax;
select * from paises;
select pais, count(pais) as repetidos from paises group by pais having count(*)>1;

SELECT DISTINCT(pais) from paises;









