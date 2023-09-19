-- Create Item Table
CREATE TABLE item (
  id              integer GENERATED ALWAYS AS IDENTITY,
  genre           varchar(100),
  author          varchar(100),
  source          varchar(100),
  label           varchar(100),
  publish_date    date,
  archived        boolean
  PRIMARY KEY(id)
);

-- Create MusicAlbum Table
CREATE TABLE music_album (
  id              integer GENERATED ALWAYS AS IDENTITY,
  publish_date    date,
  on_spotify      boolean,
  genre_id        int references genre(id),
  PRIMARY KEY(id)
);

-- Create Genre Table
CREATE TABLE genre(
  id              integer GENERATED ALWAYS AS IDENTITY,
  name            varchar(100),
  PRIMARY KEY(id)
);

-- Create Game Table
CREATE TABLE game (
  id   SERIAL PRIMARY KEY,
  name varchar(100),
  multiplayer boolean,
  last_played_at date,   
  publish_date    date,
  author_id    INT REFERENCES author(id)
);

-- Create Author Table
CREATE TABLE author(
  id  SERIAL PRIMARY KEY,
  first_name   varchar(100),
  last_name    varchar(100)
);



