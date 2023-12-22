set search_path = coffee_project;


-- Вставка данных в таблицу упаковка кофе 
INSERT INTO упаковка_кофе (название_сорта, страна, метод_обработки, уровень_обжарки, стоимость)
VALUES
    ('Арабика 1', 'Бразилия', 'Сухой', 'Светлая', '1599'),
    ('Робуста 2', 'Колумбия', 'Мокрый', 'Средняя', '1250'),
    ('Либерика', 'Эфиопия', 'Натуральный', 'Темная', '1875'),
    ('Эксельса', 'Уганда', 'Мокрый', 'Высшая', '2230'),
    ('Бурунди', 'Гондурас', 'Сухой', 'Светлая', '1680'),
    ('Карибу', 'Коста-Рика', 'Натуральный', 'Темная', '2040'),
    ('Санто-Доминго', 'Бразилия', 'Мокрый', 'Светлая', '1420'),
    ('Тай Тай', 'Колумбия', 'Натуральный', 'Средняя', '1310'),
    ('Марагоджип', 'Вьетнам', 'Сухой', 'Темная', '1760'),
    ('Бурунди АА', 'Уганда', 'Мокрый', 'Высшая', '2390'),
    ('Монсун', 'Гондурас', 'Натуральный', 'Светлая', '1925'),
    ('Сан Марино', 'Коста-Рика', 'Сухой', 'Темная', '1530'),
    ('Либерика', 'Бразилия', 'Мокрый', 'Светлая', '2110'),
    ('Арабика 2', 'Колумбия', 'Натуральный', 'Средняя', '1480'),
    ('Эфиопская Йиргачеффе', 'Эфиопия', 'Сухой', 'Темная', '2550');
   

-- Вставка данных в таблицу магазин
INSERT INTO магазин (название, город, контактный_телефон, часы_работы)
VALUES
    ('Кофейный рай', 'Москва', '+7 (916) 123-4567', '10:00-18:00'),
    ('Ароматная чашка', 'Санкт-Петербург', '+7 (905) 987-6543', '09:30-17:30'),
    ('Эспрессо магия', 'Новосибирск', '+7 (913) 111-2233', '11:00-19:00'),
    ('Кофейная студия', 'Екатеринбург', '+7 (922) 333-4455', '10:30-18:30'),
    ('Душистый кофе', 'Казань', '+7 (927) 555-6677', '10:00-18:00'),
    ('Капучино снова', 'Челябинск', '+7 (909) 777-8899', '09:00-17:00'),
    ('Латте диво', 'Омск', '+7 (905) 111-2833', '11:30-19:30'),
    ('Магия зерен', 'Самара', '+7 (927) 333-4455', '10:00-18:00'),
    ('Бодрящий кофе', 'Уфа', '+7 (922) 585-6677', '10:30-18:30'),
    ('Ароматный брейк', 'Красноярск', '+7 (916) 777-8599', '10:00-18:00'),
    ('Эспрессо кинг', 'Воронеж', '+7 (905) 111-2233', '09:00-17:00'),
    ('Кофейный уголок', 'Пермь', '+7 (909) 333-4455', '11:30-19:30'),
    ('Фрагрантное утро', 'Волгоград', '+7 (922) 555-6677', '10:00-18:00'),
    ('Кофейная симфония', 'Ростов-на-Дону', '+7 (916) 777-8899', '10:00-18:00'),
    ('Латте радость', 'Калининград', '+7 (905) 711-2233', '09:30-17:30');
   
   
 -- Вставка данных в таблицу покупатель
INSERT INTO покупатель (имя, фамилия, номер_телефона, id_любимый_магазин)
VALUES
    ('Анна', 'Иванова', '+7 (916) 123-4567', 2),
    ('Дмитрий', 'Петров', '+7 (905) 987-6543', 1),
    ('Екатерина', 'Смирнова', '+7 (913) 111-2233', 1),
    ('Иван', 'Кузнецов', '+7 (922) 333-4455', 5),
    ('Мария', 'Васильева', '+7 (927) 555-6677', 7),
    ('Сергей', 'Александров', '+7 (909) 777-8899', 10),
    ('Ольга', 'Павлова', '+7 (905) 111-2233', 11),
    ('Александр', 'Семенов', '+7 (927) 333-4455', 5),
    ('Татьяна', 'Ильина', '+7 (922) 555-6677', 7),
    ('Павел', 'Григорьев', '+7 (916) 777-8899', 5),
    ('Наталья', 'Тимофеева', '+7 (905) 111-4233', 12),
    ('Владимир', 'Федоров', '+7 (909) 333-4455', 1),
    ('Елена', 'Сергеева', '+7 (922) 545-6677', 5),
    ('Артем', 'Иванов', '+7 (916) 777-8839', 5),
    ('Марина', 'Петрова', '+7 (905) 111-2223', 13),
    ('Григорий', 'Смирнов', '+7 (933) 111-2233', 14),
    ('Анастасия', 'Кузнецова', '+7 (992) 333-4455', 3),
    ('Денис', 'Васильев', '+7 (927) 555-4677', 3),
    ('София', 'Александрова', '+7 (929) 777-8899', null),
    ('Артур', 'Павлов', '+7 (905) 111-2433', null);
   
  
 -- Вставка данных в таблицу товар_в_наличии
INSERT INTO товар_в_наличии (id_магазин, id_упаковка_кофе, количество_товара)
SELECT
    m.id_магазин,
    у.id_упаковка_кофе,
    (random() * 50)::integer  -- Генерация случайного количества товара от 10 до 60
FROM
    (SELECT generate_series(1, 15) AS id_магазин) m,
    (SELECT generate_series(1, 15) AS id_упаковка_кофе) у
ORDER BY
    random()
LIMIT 225;


-- Вставка данных в таблицу обжарщик
INSERT INTO обжарщик (компания, контактное_лицо, номер_телефона, страна)
VALUES
    ('Кофе Экспресс', 'Иван Петров', '+7 (916) 123-4567', 'Беларусь'),
    ('Эль Паладар', 'Алексей Смирнов', '+7 (913) 111-2453', 'Казахстан'),
    ('Лучший Вкус', 'Дмитрий Васильев', '+7 (927) 555-6527', 'Казахстан'),
    ('Ароматный Мир', 'Светлана Александрова', '+7 (909) 777-5299', 'Беларусь'),
    ('Прекрасный Аромат', 'Владимир Ильин', '+7 (922) 525-6677', 'Казахстан'),
    ('Кофе Любви', 'Ольга Григорьева', '+7 (916) 777-5299', 'Казахстан'),
    ('Арома Рай', 'Наталья Федорова', '+7 (909) 523-5255', 'Беларусь'),
    ('Кофейная Сказка', 'Максим Петров', '+7 (905) 521-2523', 'Беларусь');


INSERT INTO обжарщик (компания, контактное_лицо, номер_телефона )
VALUES
  ('Арома Кофе', 'Марина Иванова', '+7 (905) 937-6543'),
  ('Кофейная Атмосфера', 'Елена Кузнецова', '+7 (952) 333-4455'),
    ('Кофеин', 'Игорь Павлов', '+7 (905) 111-5223'),
    ('Феерия Зерен', 'Анна Семенова', '+7 (927) 333-5225'),
    ('Золотой Эспрессо', 'Артем Тимофеев', '+7 (905) 111-2523'),
    ('Магия Зерен', 'Сергей Сергеев', '+7 (922) 525-5277'),
    ('Латте Страсть', 'Кристина Иванова', '+7 (916) 777-5229');
   
-- Вставка данных в таблицу поставка
INSERT INTO поставка (дата, количество_упаковок, id_обжарщик, id_упаковка_кофе)
VALUES
    ('2023-01-01'::timestamp, 100, 1, 1),
    ('2023-01-02'::timestamp, 80, 2, 2),
    ('2023-01-03'::timestamp, 60, 3, 3),
    ('2023-01-04'::timestamp, 90, 4, 4),
    ('2023-01-05'::timestamp, 70, 5, 5),
    ('2023-01-06'::timestamp, 100, 1, 6),
    ('2023-01-07'::timestamp, 80, 2, 7),
    ('2023-01-08'::timestamp, 60, 3, 8),
    ('2023-01-09'::timestamp, 90, 4, 9),
    ('2023-01-10'::timestamp, 70, 5, 10),
    ('2023-01-11'::timestamp, 100, 1, 11),
    ('2023-01-12'::timestamp, 80, 2, 12),
    ('2023-01-13'::timestamp, 60, 3, 13),
    ('2023-01-14'::timestamp, 90, 4, 14),
    ('2023-01-15'::timestamp, 70, 5, 15),
    ('2023-01-16'::timestamp, 100, 1, 1),
    ('2023-01-17'::timestamp, 80, 2, 2),
    ('2023-01-18'::timestamp, 60, 3, 3),
    ('2023-01-19'::timestamp, 90, 4, 4),
    ('2023-01-20'::timestamp, 70, 5, 5),
    ('2023-01-01'::timestamp, 100, 5, 1),
    ('2023-01-02'::timestamp, 80, 6, 2),
    ('2023-01-03'::timestamp, 60, 7, 3),
    ('2023-01-04'::timestamp, 90, 8, 4),
    ('2023-01-05'::timestamp, 70, 9, 5),
    ('2023-01-06'::timestamp, 100, 10, 6),
    ('2023-01-07'::timestamp, 80, 5, 7),
    ('2023-01-08'::timestamp, 60, 6, 8),
    ('2023-01-09'::timestamp, 90, 7, 9),
    ('2023-01-10'::timestamp, 70, 8, 10),
    ('2023-01-11'::timestamp, 100, 9, 11),
    ('2023-01-12'::timestamp, 80, 10, 12),
    ('2023-01-13'::timestamp, 60, 5, 13),
    ('2023-01-14'::timestamp, 90, 6, 14),
    ('2023-01-15'::timestamp, 70, 7, 15),
    ('2023-01-16'::timestamp, 100, 8, 1),
    ('2023-01-17'::timestamp, 80, 9, 2),
    ('2023-01-18'::timestamp, 60, 10, 3),
    ('2023-01-19'::timestamp, 90, 5, 4),
    ('2023-01-20'::timestamp, 70, 6, 5),
    ('2023-01-21'::timestamp, 100, 7, 6),
    ('2023-01-22'::timestamp, 80, 8, 7),
    ('2023-01-23'::timestamp, 60, 9, 8),
    ('2023-01-24'::timestamp, 90, 10, 9),
    ('2023-01-25'::timestamp, 70, 5, 10),
    ('2023-01-01'::timestamp, 100, 10, 1),
    ('2023-01-02'::timestamp, 80, 11, 2),
    ('2023-01-03'::timestamp, 60, 12, 3),
    ('2023-01-04'::timestamp, 90, 13, 4),
    ('2023-01-05'::timestamp, 70, 14, 5),
    ('2023-01-06'::timestamp, 100, 15, 6),
    ('2023-01-07'::timestamp, 80, 10, 7),
    ('2023-01-08'::timestamp, 50, 9, 8),
    ('2023-01-08'::timestamp, 60, 11, 8),
    ('2023-01-09'::timestamp, 90, 12, 9),
    ('2023-01-10'::timestamp, 70, 13, 10),
    ('2023-01-11'::timestamp, 100, 14, 11),
    ('2023-01-12'::timestamp, 80, 15, 12),
    ('2023-01-13'::timestamp, 60, 10, 13),
    ('2023-01-14'::timestamp, 90, 11, 14),
    ('2023-01-15'::timestamp, 70, 12, 15),
    ('2023-01-16'::timestamp, 100, 13, 1),
    ('2023-01-17'::timestamp, 80, 14, 2),
    ('2023-01-18'::timestamp, 60, 15, 3),
    ('2023-01-19'::timestamp, 90, 10, 4),
    ('2023-01-20'::timestamp, 70, 11, 5),
    ('2023-01-21'::timestamp, 100, 12, 6),
    ('2023-01-22'::timestamp, 80, 13, 7),
    ('2023-01-23'::timestamp, 60, 14, 8),
    ('2023-01-24'::timestamp, 90, 15, 9),
    ('2023-01-25'::timestamp, 70, 10, 10);
    

-- Создание таблица заказ
   INSERT INTO заказ (сумма, дата, статус, id_покупатель, id_магазин)
VALUES
    (14357, '2023-12-01 10:00:00', 'В обработке', 1, 1),
    (5840, '2023-12-02 11:30:00', 'Принят', 2, 2),
    (13485, '2023-12-03 12:45:00', 'Сформирован', 3, 3),
    (19390, '2023-12-04 14:15:00', 'Отправлен', 4, 4),
    (13609, '2023-12-05 15:30:00', 'Выполнен', 5, 5),
    (5790, '2023-12-06 09:45:00', 'В обработке', 6, 6),
    (18050, '2023-12-07 08:30:00', 'Принят', 7, 7),
    (8900, '2023-11-08 07:15:00', 'Сформирован', 8, 8),
    (19775, '2023-12-09 17:00:00', 'Отправлен', 9, 9),
    (10600, '2023-11-10 16:20:00', 'Выполнен', 10, 10),
    (1680,'2023-12-11 14:45:00', 'В обработке', 11, 11),
    (20780, '2023-12-12 12:30:00', 'Принят', 12, 12),
    (12171, '2023-12-13 10:15:00', 'Сформирован', 13, 13),
    (15250, '2023-12-14 09:00:00', 'Отправлен', 14, 14),
    (13760, '2023-12-15 08:10:00', 'Выполнен', 15, 15),
    (1760, '2023-12-16 16:30:00', 'В обработке', 16, 1),
    (13300, '2023-12-17 15:45:00', 'Принят', 17, 2),
    (10050, '2023-12-18 14:00:00', 'Сформирован', 18, 3),
    (6390, '2023-12-19 13:20:00', 'Отправлен', 19, 4),
    (6260, '2023-12-20 11:55:00', 'Выполнен', 20, 5);
   
   
-- Создание таблицы заказ_кофе 
INSERT INTO заказ_кофе (id_заказ, id_упаковка_кофе, количество_товара)
VALUES
    (1, 1, 3),
    (17, 5, 2),
    (1, 10, 4),
    (2, 2, 1),
    (17, 7, 5),
    (2, 12, 3),
    (3, 3, 2),
    (3, 8, 6),
    (18, 13, 1),
    (4, 4, 5),
    (4, 9, 3),
    (4, 14, 2),
    (5, 1, 1),
    (5, 6, 4),
    (5, 11, 2),
    (18, 2, 6),
    (6, 7, 3),
    (6, 12, 1),
    (7, 3, 4),
    (19, 8, 2),
    (7, 13, 5),
    (8, 4, 2),
    (16, 1, 1),
    (8, 14, 3),
    (9, 1, 5),
    (9, 6, 2),
    (9, 11, 4),
    (19, 2, 3),
    (10, 7, 1),
    (10, 12, 6),
    (11, 5, 1),
    (15, 8, 4),
    (20, 13, 2),
    (12, 4, 6),
    (20, 9, 2),
    (12, 14, 5),
    (13, 1, 4),
    (20, 6, 1),
    (13, 11, 3),
    (14, 2, 2),
    (15, 7, 4),
    (14, 12, 5);
   

-- Создание таблицы отзыв
INSERT INTO отзыв (текст, оценка, id_покупатель, id_упаковка_кофе, id_магазин)
VALUES
    ('Отличный сервис!', 5, 1, 3, 1),
    ('Качественный кофе, доставка быстрая.', 4, 2, 2, 2),
    ('Не понравился вкус кофе.', 2, 3, 8, 3),
    ('Супер! Буду заказывать еще.', 5, 4, 9, 4),
    ('Рекомендую всем любителям кофе.', 5, 5, 11, 5),
    ('Нормально, но можно лучше.', 3, 6, 7, 6),
    ('Отличное обслуживание.', 5, 7, 13, 7),
    ('Не понравилась упаковка.', 2, 8, 14, 8),
    ('Быстрая доставка, но неудобное приложение.', 4, 9, 6, 9),
    ('Все отлично, спасибо!', 5, 10, 12, 10),
    ('Супер качество!', 5, 11, 5, 11),
    ('Неплохо, но дорого.', 3, 12, 14, 12),
    ('Заказывал первый раз, все устроило.', 4, 13, 1, 13),
    ('Не оправдал ожидания.', 2, 14, 2, 14),
    ('Отвратительно, не рекомендую.', 1, 15, 8, 15),
    ('Лучший кофе в городе!', 5, 16, 9, 1),
    ('Доставка опоздала.', 2, 17, 7, 2),
    ('Неплохо, но не идеально.', 3, 18, 15, 3),
    ('Кофе вкусный, но дороговато.', 4, 19, 8, 4),
    ('Все отлично, спасибо за быструю доставку!', 5, 20, 6, 5);

   
   -- Создание таблицы история_покупатель
INSERT INTO покупатель_история (имя, фамилия, номер_телефона, id_любимый_магазин, id_покупатель)
VALUES
    ('Анна', 'Иванова', '+7 (916) 123-4567', 2, 1),
    ('Дмитрий', 'Петров', '+7 (905) 987-6543', 1, 2),
    ('Екатерина', 'Смирнова', '+7 (913) 111-2233', 1, 3),
    ('Иван', 'Кузнецов', '+7 (922) 333-4455', 5, 4);
