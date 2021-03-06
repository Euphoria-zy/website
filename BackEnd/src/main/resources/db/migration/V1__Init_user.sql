CREATE TABLE user (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    name VARCHAR DEFAULT NULL,
    description VARCHAR DEFAULT NULL
);

CREATE TABLE user_permission (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    permission VARCHAR NOT NULL,
    user_id BIGINT NOT NULL,
    CONSTRAINT FK_USER_PERMISSION_USER_ID
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE user_detail (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    key VARCHAR NOT NULL,
    value VARCHAR NOT NULL,
    user_id BIGINT NOT NULL,
    CONSTRAINT FK_USER_DETAIL_USER_ID
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

INSERT INTO user(username, password)
    VALUES('root', '$2a$10$j5MBYxDLGdkyM6Caa88kKetRCswJxGiVKLcf/x.7JfYSzROcGZVO2');
// Password is bcrypto of "rootroot"