BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "usuaris" (
	"usu_id"	INTEGER,
	"usu_mail"	TEXT NOT NULL UNIQUE,
	"usu_paraula_clau"	TEXT NOT NULL,
	"usu_nivell"	TEXT NOT NULL CHECK("usu_nivell" IN ('subscriber', 'author', 'editor', 'admin')),
	PRIMARY KEY("usu_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "articles" (
	"art_id"	INTEGER,
	"art_titol"	TEXT NOT NULL,
	"art_contingut"	TEXT NOT NULL,
	"art_data_publicacio"	DATETIME DEFAULT CURRENT_TIMESTAMP,
	"art_visibilitat"	TEXT NOT NULL CHECK("art_visibilitat" IN ('public', 'subscriber')),
	"usu_id"	INTEGER,
	PRIMARY KEY("art_id" AUTOINCREMENT),
	FOREIGN KEY("usu_id") REFERENCES "usuaris"("usu_id") ON DELETE SET NULL
);
INSERT INTO "usuaris" ("usu_id","usu_mail","usu_paraula_clau","usu_nivell") VALUES (1,'kent.brockman@springfieldnews.com','9a9d929bf3722fc741635ed9f00138d7','editor'),
 (2,'lisa.simpson@springfieldnews.com','bdcd139c5cd47e27ac7cff7378a62147','editor'),
 (3,'homer.simpson@springfieldnews.com','dffcea993c1c4feab1358010ffdce73d','admin'),
 (4,'bart.simpson@springfieldnews.com','d88d98df6727f87376c93e9676978146','author'),
 (5,'moe.szyslak@springfieldnews.com','5406e9a6fb8f2cb3e83cf090b8b54c9d','subscriber');
INSERT INTO "articles" ("art_id","art_titol","art_contingut","art_data_publicacio","art_visibilitat","usu_id") VALUES (1,'Pluja de donuts a Springfield','Milers de donuts han caigut del cel avui, causant embussos i el col·lapse de la policia local, amb el cap Wiggum liderant la investigació.','2025-01-31 13:45:08','public',1),
 (2,'Lisa Simpson descobreix nova espècie de saxofonistes','Lisa ha trobat una colònia de saxofonistes salvatges a la muntanya Springfield, capaços d’improvisar solos de jazz amb una precisió impecable.','2025-02-12 11:23:08','subscriber',2),
 (3,'Homer Simpson proposa el dia internacional de la cervesa Duff','El Sr. Simpson ha presentat una petició perquè la cervesa Duff tingui el seu propi dia festiu. La proposta ha estat aprovada per un 100% dels clients del bar de Moe.','2025-04-01 08:45:08','public',2),
 (4,'Bart pinta una caricatura gegant del director Skinner','El jove Bart Simpson ha estat enxampat dibuixant una versió còmica de Skinner a la façana de l’escola primària de Springfield.','2025-03-11 14:15:08','subscriber',4),
 (5,'Mr. Burns intenta comprar la Lluna','El magnat multimilionari Montgomery Burns ha anunciat la seva intenció d’adquirir la Lluna i fer-la la seva residència d’estiu.','2025-03-24 21:45:08','public',1),
 (6,'Krusty el Pallasso anuncia una nova línia de menjar saludable','Krusty promet hamburgueses 99% naturals, però investigadors descobreixen que estan fetes de pasta de peix fluorescents.','2024-11-11 11:11:11','subscriber',1),
 (7,'Marge Simpson denuncia l’ús excessiu de cabells blaus als anuncis','Marge ha protestat davant la televisió de Springfield pel fet que massa personatges publicitaris tenen el cabell blau, dient que la tendència ha d’acabar.','2024-12-31 23:59:08','public',2),
 (8,'El bar de Moe ofereix còctels temàtics de Springfield','Moe ha creat begudes inspirades en cada personatge famós de la ciutat, incloent el "Flaming Homer" i el "Duff Deluxe".','2025-02-21 12:41:08','subscriber',2),
 (9,'Milhouse guanya un torneig d’escacs sense saber jugar','Milhouse Van Houten ha sorprès la comunitat escaquística guanyant un torneig gràcies a una sèrie de moviments completament atzarosos.','2025-01-01 18:45:08','public',4),
 (10,'Springfield es queda sense rosquilles per culpa de Homer','L’última remesa de rosquilles de la ciutat ha desaparegut misteriosament després que Homer visités la fàbrica amb "bones intencions".','2025-02-01 19:00:08','subscriber',3);
COMMIT;
