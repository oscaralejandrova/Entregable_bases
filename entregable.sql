--tabla users--

create table users(
id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

select * from users;

--tabla posts--

create table posts(
id serial primary key,
	creator_id int references users(id),
	title varchar(30),
	text_post text
);

select * from posts;

--tabla likes--
create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

select * from likes;

--insert users--

insert into users(first_name, last_name, email)values
('Oscar', 'Alarcon', 'oscar@gmail.com'),
('Adrian', 'Alarcon', 'adrian@gmail.com'),
('Juan', 'Perez', 'juanqgmail.com');

--insert posts--

insert into posts(creator_id, title, text_post)values
(1, 'Critica constructiva', 'Adrian no me agrada por que es engreido'),
(2, 'Me cae bien', 'Me cae bien Juan por que es chistoso'),
(3, 'No tengo quejas', 'Todo bien por el momento'),
(2, 'Cosas que cambiar', 'No hay buena comunicacon con Oscar'),
(3, 'Todo bien', 'Todo correcto por el momento');

-- insert likes--
insert into likes (user_id, post_id)values
(2, 3),
(2, 1),
(3, 1),
(3, 2),
(1, 9);


--posts - users--
select * from posts inner join users
on posts.creator_id = users.id;

--posts-likes-users
select * from posts inner join likes
on posts.id = likes.post_id inner join users
on likes.user_id = users.id;















