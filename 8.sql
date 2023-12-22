DROP SCHEMA IF EXISTS view_coffee_project CASCADE;
CREATE SCHEMA view_coffee_project;

SET SEARCH_PATH = view_coffee_project;


-- 1. Предпочтения Покупателей по именам
-- Данное представление показывает 3 самых популярных сорта кофе среди представителей одного имени и сколько упаковок каждого сорта было куплено
-- Если покупатель приобрел меньше трех различных сортов, то будут выведены все. 
-- Если покупатель приобрел несколько топовых сортов в одиннаковом количестве, то будут выведены все 
CREATE or REPLACE VIEW view_совместимость_кофе_и_имени AS 
WITH сводная_таблица_по_имени AS (
    SELECT
        п.имя,
        ук.id_упаковка_кофе,
        ук.название_сорта,
        COALESCE(SUM(зк.количество_товара), 0) AS количество_покупок,
        RANK() OVER (PARTITION BY п.имя ORDER BY COALESCE(SUM(зк.количество_товара), 0) DESC) AS ранг
    FROM
        coffee_project.покупатель п
    LEFT JOIN
        coffee_project.заказ AS з ON п.id_покупатель = з.id_покупатель AND з.дата >= CURRENT_DATE - INTERVAL '2 month'
    LEFT JOIN
        coffee_project.заказ_кофе AS зк ON з.id_заказ = зк.id_заказ
    LEFT JOIN
        coffee_project.упаковка_кофе AS ук ON зк.id_упаковка_кофе = ук.id_упаковка_кофе
    GROUP BY
        п.имя, ук.id_упаковка_кофе
)
SELECT
    имя,
    id_упаковка_кофе,
    COALESCE(количество_покупок, 0) AS количество_покупок
FROM (
    SELECT
        имя,
        id_упаковка_кофе,
        количество_покупок,
        ROW_NUMBER() OVER (PARTITION BY имя ORDER BY количество_покупок DESC) AS ранг
    FROM
        сводная_таблица_по_имени
) AS кофе_ранги
WHERE
    ранг <= 3;

   

 --2. Аналитика предпочтений в каждом магазине
-- Данное представление позволяет узнать в каждом магазине сорт кофе, который купили больше всего и в каком количестве
-- Если за последний месяц не было заказов, то в атрибуте "название_самого_популярного_сорта" стоит NULL
-- Если в одном магазине есть 2 и более самых продаваемых сорта, то они все отображены в представлении 
CREATE or REPLACE VIEW view_популярный_кофе_в_магазине AS 
WITH сводная_таблица_кофе AS (
    SELECT
        м.id_магазин,
        м.название,
        ук.id_упаковка_кофе,
        ук.название_сорта,
        COALESCE(SUM(зк.количество_товара), 0) AS общее_количество,
        RANK() OVER (PARTITION BY м.id_магазин ORDER BY COALESCE(SUM(зк.количество_товара), 0) DESC) AS ранг
    FROM
        coffee_project.магазин AS м
    LEFT JOIN
        coffee_project.заказ AS з ON м.id_магазин = з.id_магазин AND з.дата >= CURRENT_DATE - INTERVAL '1 month'
    LEFT JOIN
        coffee_project.заказ_кофе AS зк ON з.id_заказ = зк.id_заказ
    LEFT JOIN
        coffee_project.упаковка_кофе AS ук ON зк.id_упаковка_кофе = ук.id_упаковка_кофе
    GROUP BY
        м.id_магазин, ук.id_упаковка_кофе
)
SELECT
    название AS название_магазина, 
    название_сорта AS название_самого_популярного_сорта,
    общее_количество,
    ранг
FROM
    сводная_таблица_кофе
WHERE
    ранг = 1 OR id_магазин IS NULL;
   
   
-- Аналитика Отзывов
-- Это представление дает возможность, составить рейтинг кофе, опираясь на мнение покупателей и также предоставляет комментарий с лучшей оценкой
-- Если отзывов нет, то средний_балл/количество_отзывов/лучший_отзыв заполняются нулями и "Нет отзывов" соответственно
-- Если отзывов с лучшей оценкой несколько, то выводится только один из них, с целью не перегружать аналитиков информацией 
CREATE or REPLACE VIEW view_лучший_кофе_по_отзывам as 
WITH средняя_оценка AS (
    SELECT
        ук.id_упаковка_кофе,
        AVG(о.оценка) AS средний_балл
    FROM
        coffee_project.упаковка_кофе ук
    LEFT JOIN
        coffee_project.отзыв AS о ON ук.id_упаковка_кофе =о.id_упаковка_кофе
    GROUP BY
        ук.id_упаковка_кофе
),
статистика_отзывы AS (
    SELECT
        id_упаковка_кофе,
        COUNT(*) AS количество_отзывов,
        MAX(оценка) AS лучший_балл
    FROM
        coffee_project.отзыв
    GROUP BY
        id_упаковка_кофе
),
лучший_отзыв as (
    SELECT
   		DISTINCT ON (o.id_упаковка_кофе)
        o.id_упаковка_кофе,
        o.оценка AS лучший_балл,
        o.текст AS лучший_отзыв
    FROM
        coffee_project.отзыв o
    ORDER BY
        o.id_упаковка_кофе, o.оценка DESC
)
SELECT
    ук.id_упаковка_кофе,
    COALESCE(со.средний_балл, 0) AS средний_балл,
    COALESCE(сто.количество_отзывов, 0) AS количество_отзывов,
    COALESCE(ло.лучший_отзыв, 'Нет отзывов') AS лучший_отзыв
FROM
    coffee_project.упаковка_кофе ук
LEFT JOIN
    средняя_оценка со ON ук.id_упаковка_кофе = со.id_упаковка_кофе
LEFT JOIN
    статистика_отзывы сто ON ук.id_упаковка_кофе = сто.id_упаковка_кофе
LEFT JOIN
     лучший_отзыв ло ON ук.id_упаковка_кофе = ло.id_упаковка_кофе
order by 
	 (средний_балл, количество_отзывов) desc ;


