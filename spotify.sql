Database Name

CREATE DATABASE spotify;

USE spotify;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    country VARCHAR(50),
    signup_date DATE,
    age INT,
    gender VARCHAR(20)
);

CREATE TABLE artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100),
    genre VARCHAR(50),
    country VARCHAR(50),
    debut_year INT
);


CREATE TABLE albums (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT,
    album_name VARCHAR(100),
    release_date DATE,
    total_tracks INT,

    FOREIGN KEY (artist_id)
    REFERENCES artists(artist_id)
);

CREATE TABLE songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT,
    artist_id INT,
    song_name VARCHAR(150),
    duration_seconds INT,
    language VARCHAR(30),
    release_date DATE,
    play_count BIGINT DEFAULT 0,

    FOREIGN KEY (album_id)
    REFERENCES albums(album_id),

    FOREIGN KEY (artist_id)
    REFERENCES artists(artist_id)
);

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    playlist_name VARCHAR(100),
    created_at DATETIME,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);


CREATE TABLE playlist_songs (
    playlist_id INT,
    song_id INT,

    PRIMARY KEY (playlist_id, song_id),

    FOREIGN KEY (playlist_id)
    REFERENCES playlists(playlist_id),

    FOREIGN KEY (song_id)
    REFERENCES songs(song_id)
);

Core analytics table.
CREATE TABLE listening_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    song_id INT,
    listened_at DATETIME,
    device_type VARCHAR(50),
    minutes_played DECIMAL(5,2),

    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    FOREIGN KEY (song_id)
    REFERENCES songs(song_id)
);

CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    plan_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    payment_amount DECIMAL(10,2),

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);
