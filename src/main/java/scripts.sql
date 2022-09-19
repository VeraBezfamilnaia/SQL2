create table CUSTOMERS
(
    id           serial primary key,
    name         text    not null,
    surname      text    not null,
    age          integer not null,
    phone_number text not null
);

insert into CUSTOMERS (name, surname, age, phone_number)
values ('Harrison', 'Mclaughlin', 39, '1-886-665-5850'),
       ('Felix', 'Carr', 31, '1-836-751-1541'),
       ('Ferdinand', 'Doyle', 39, '1-646-647-9277'),
       ('Grant', 'Abbott', 30, '1-782-758-7285'),
       ('Luke', 'Klein', 25, '1-940-178-4304'),
       ('Ivory', 'Pennington', 32, '1-285-223-2253'),
       ('Eliana', 'Leblanc', 35, '1-534-872-1746'),
       ('Wayne', 'Floyd', 42, '1-531-738-2386'),
       ('Lyle', 'Joyner', 41, '1-981-343-2858'),
       ('Yoshio', 'Singleton', 24, '1-650-622-3219');


create table ORDERS
(
    id           serial primary key,
    date         date    not null,
    customer_id  integer not null,
    product_name text    not null,
    amount       integer not null,
    foreign key (customer_id) references CUSTOMERS (id)
);

insert into ORDERS (date, customer_id, product_name, amount)
values ('02.28.22', 10, 'fridge', 1),
       ('02.19.22', 10, 'light', 1),
       ('12.21.22', 2, 'fridge', 1),
       ('03.10.22', 6, 'car', 1),
       ('09.13.22', 9, 'phone', 2),
       ('03.10.22', 1, 'car', 1),
       ('09.13.22', 3, 'table', 2),
       ('12.12.22', 10, 'fridge', 1),
       ('06.17.22', 9, 'car', 1),
       ('08.05.22', 9, 'phone', 3),
       ('10.10.22', 7, 'smart assistant', 3),
       ('09.13.22', 5, 'laptop', 2);

create index customer_id_index
    on orders(customer_id);

select o.product_name, o.amount, c.name, c.surname
from ORDERS o inner join CUSTOMERS c on c.id = o.customer_id
where name ilike 'alexey';