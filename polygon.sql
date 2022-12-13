DROP TABLE IF EXISTS public.geo_entity;
CREATE TABLE IF NOT EXISTS public.geo_entity
(
    id integer PRIMARY KEY,
    geom geometry(Polygon,4674),
    name character varying
);
insert into geo_entity(id, geom, name) values (1,  ST_GeometryFromText('Polygon ((-51.60147582129579291 -25.43029898857576399, -51.58507704741376187 -25.28598977841388873, -51.41452979904063625 -25.25975174020263836, -51.40141077993501284 -25.39422168603529428, -51.60147582129579291 -25.43029898857576399))', 4674), 'ENTIDADE 1');
insert into geo_entity(id, geom, name) values (2,  ST_GeometryFromText('Polygon ((-50.62738865270312516 -24.67267563522591445, -50.46668066865922242 -24.52508667028763156, -50.3453297419321899 -24.60708053969778675, -50.35188925148499806 -24.69563391866075719, -50.40108557313109117 -24.72187195687200756, -50.62738865270312516 -24.67267563522591445))', 4674), 'ENTIDADE 2');
insert into geo_entity(id, geom, name) values (3,  ST_GeometryFromText('Polygon ((-51.31859697183076463 -25.35650450610662787, -51.27350034365517928 -25.27943026886108058, -51.23578316372650931 -25.31468763270745015, -51.2275837767854938 -25.35732444480073156, -51.31859697183076463 -25.35650450610662787))', 4674), 'ENTIDADE 3');
insert into geo_entity(id, geom, name) values (4,  ST_GeometryFromText('Polygon ((-51.50964268755643616 -25.52541187709155324, -51.49078409759209762 -25.46965604589264487, -51.41780955381705809 -25.49343426802159129, -51.42026936989935848 -25.53771095750307651, -51.50964268755643616 -25.52541187709155324))', 4674), 'ENTIDADE 4');
insert into geo_entity(id, geom, name) values (5,  ST_GeometryFromText('Polygon ((-50.62738865270313227 -24.79320662325884683, -50.56507331195141575 -24.72761152773071913, -50.49619846164688397 -24.76696858504759646, -50.56179355717500812 -24.82600417102290891, -50.62738865270313227 -24.79320662325884683))', 4674), 'ENTIDADE 5');

select 
	pr_cities."NM_MUN" as municipio,
	geo_entity.id as id_entidade,
	geo_entity.name as nome_entidade
from 
	public.geo_entity, public.pr_cities
where 
	st_intersects(geo_entity.geom, pr_cities.geom);
	
select 
	pr_cities."NM_MUN" as municipio,
	geo_entity.id as id_entidade,
	geo_entity.name as nome_entidade
from 
	public.geo_entity, public.pr_cities
where 
	st_intersects(geo_entity.geom, pr_cities.geom)
and pr_cities."NM_MUN"='Guarapuava';
