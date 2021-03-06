/*

    Copyright (c) 2013 Tender.Pro http://tender.pro.

    This file is part of PGWS - Postgresql WebServices.

    PGWS is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PGWS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with PGWS.  If not, see <http://www.gnu.org/licenses/>.

    Тесты авторегистрации типов, составляющих аргументы и результат метода
*/

/* ------------------------------------------------------------------------- */
SET search_path = 'ws';

CREATE DOMAIN d_test_3 AS INT; 
CREATE DOMAIN d_test_4 AS TEXT;
CREATE DOMAIN d_test_5 AS INT; 
SELECT
  pg_c('d','d_test_3', 'Домен 3')
, pg_c('d','d_test_4', 'Домен 4')
, pg_c('d','d_test_5', 'Домен 5');
CREATE TYPE ws.t_test_1 AS (
  _a    d_test_3
 ,_b    d_test_4)
;
CREATE TYPE ws.t_test_2 AS (
  _c    d_test_3
 ,_d    d_test_4)
;
SELECT pg_c('t','t_test_1', 'Тест автоудаления типов 1')
, pg_c('c','t_test_1._a',   'Кол. a')
, pg_c('c','t_test_1._b',   'Кол. b')
;
SELECT pg_c('t','t_test_2', 'Тест автоудаления типов 2')
, pg_c('c','t_test_2._c',   'Кол. c')
, pg_c('c','t_test_2._d',   'Кол. d')
;

CREATE FUNCTION ws.dt_autodelete(a_inp ws.d_test_5) RETURNS SETOF ws.t_test_1 VOLATILE LANGUAGE 'sql' AS
$_$
  SELECT (0,' ')::ws.t_test_1;
$_$;
INSERT INTO method (code, class_id, action_id, cache_id, rvf_id, code_real, name) VALUES
 ('ws.dt_autodelete',2, 1, 2, 3, pg_cs('dt_autodelete'), 'Test autodelete')
;

SELECT * FROM ws.dt 
  WHERE code IN ('ws.t_test_1','ws.d_test_3','ws.d_test_4','ws.d_test_5','ws.z_dt_autodelete')
  ORDER BY code
;
SELECT * FROM ws.dt_part
  WHERE dt_code IN ('ws.t_test_1','ws.z_dt_autodelete')
  ORDER BY dt_code, part_id
;

DELETE FROM ws.method WHERE code ='ws.dt_autodelete';

SELECT * FROM ws.dt 
  WHERE code IN ('ws.t_test_1','ws.d_test_3','ws.d_test_4','ws.d_test_5','ws.z_dt_autodelete')
  ORDER BY code
;
SELECT * FROM ws.dt_part
  WHERE dt_code IN ('ws.t_test_1','ws.z_dt_autodelete')
  ORDER BY dt_code, part_id
;

/* ------------------------------------------------------------------------- */

