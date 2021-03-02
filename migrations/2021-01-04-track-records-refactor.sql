BEGIN;

ALTER TABLE track_records ALTER COLUMN track_day DROP EXPRESSION;

ALTER TABLE track_records RENAME COLUMN track_day TO day;

ALTER TABLE track_records RENAME CONSTRAINT 
  track_records_habit_id_track_day_key TO track_records_habit_id_day_key;

ALTER TABLE track_records DROP track_date;

COMMIT;
