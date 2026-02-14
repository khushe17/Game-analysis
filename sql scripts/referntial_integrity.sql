#Establishing Referential Integrity 
#add the Foreign Key Column (game_id)
ALTER TABLE vgsales
ADD COLUMN game_id INT;

#Populate game_id Using Business Logic
UPDATE vgsales v
JOIN games_final g
  ON v.name = g.title
SET v.game_id = g.game_id;

#Validate the Mapping
SELECT COUNT(*)
FROM vgsales
WHERE game_id IS NULL;

#Enforce Referential Integrity
ALTER TABLE vgsales
ADD CONSTRAINT fk_vgsales_game
FOREIGN KEY (game_id)
REFERENCES games_final(game_id);