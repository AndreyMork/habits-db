ALTER TABLE habits 
ADD CONSTRAINT habits_title_not_empty_check
CHECK (title <> '');
