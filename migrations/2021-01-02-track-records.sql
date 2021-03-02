BEGIN;

ALTER TABLE habits ADD UNIQUE (title);

CREATE TYPE _STATUS AS ENUM (
  'checked',
  'skipped'
);


CREATE TABLE track_records (
  id         integer     PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  created_at timestamptz NOT NULL    DEFAULT current_timestamp,

  habit_id   integer     NOT NULL    REFERENCES habits(id) ON DELETE CASCADE,

  track_date timestamptz NOT NULL,
  track_day  date        NOT NULL    GENERATED ALWAYS AS (track_date) STORED,

  status     _status     NOT NULL
);

COMMIT;
