/*

    Copyright (c) 2010, 2012 Tender.Pro http://tender.pro.

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

    Регистрация страниц сайта
*/
--page.up_code
\set UPC 'group.info.devel'
--page.sort
\set SRT 11
--page.uri
\set URI 'info/devel/site'

/* ------------------------------------------------------------------------- */
INSERT INTO i18n_def.page (code, up_code, class_id, action_id, sort, uri, tmpl, name) VALUES
  ('main',              NULL,         2, 1, 0,    '$',   :'PKG' || '/index', 'API')
, ('group.info',        'main',       2, 1, 3,    NULL,  NULL,               'Информация')
, ('group.info.devel',  'group.info', 2, 1, 9,    NULL,  NULL,               'Разработчику')
, ('my',                'main',       1, 2, 9,    'my$', :'PKG' || '/my',    'Кабинет')
;
/*
INSERT INTO i18n_def.page (code, up_code, class_id, action_id, sort, uri, tmpl, name) VALUES
 ('api.style',          'group.info', 2, 1, NULL, 'info/style$',      :'PKG' || '/style_set', 'Стиль интерфейса')
;
*/

/* ------------------------------------------------------------------------- */
SELECT ws.register_pages_apidoc(:'UPC', 2, 1, :'URI', :SRT);
INSERT INTO i18n_def.page (code, up_code, class_id, action_id, sort, uri, tmpl, name) VALUES
  ('api.perm', :'UPC', 2, 1, :SRT + 6, :'URI' || '/perm$', 'acc/apidoc/perm',    'Разрешения')
, ('api.role', :'UPC', 2, 1, :SRT + 7, :'URI' || '/role$', 'acc/apidoc/role',    'Роли')
;