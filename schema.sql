CREATE TYPE _status AS ENUM (
  'checked',
  'skipped'
);

CREATE TABLE habits (
  id         integer     PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  created_at timestamptz NOT NULL    DEFAULT current_timestamp,

  title      text        NOT NULL    UNIQUE
    CONSTRAINT habits_title_not_empty_check CHECK (title <> '')
);

CREATE TABLE track_records (
  id         integer     PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  created_at timestamptz NOT NULL    DEFAULT current_timestamp,

  habit_id   integer     NOT NULL    REFERENCES habits (id) ON DELETE CASCADE,
  day        date        NOT NULL,
  status     _status     NOT NULL,

  UNIQUE (habit_id, day)
);
