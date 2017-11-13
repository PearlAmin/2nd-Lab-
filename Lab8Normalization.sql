-- Pearl Amin
-- Lab 8 Normalization 2
-- Nov 13th, 2017
-- Database Systems  

DROP TABLE IF EXISTS People CASCADE;
DROP TABLE IF EXISTS Actors CASCADE;
DROP TABLE IF EXISTS Spouses CASCADE;
DROP TABLE IF EXISTS Movies CASCADE ;
DROP TABLE IF EXISTS Directors CASCADE;
DROP TABLE IF EXISTS MovieActors CASCADE;
DROP TABLE IF EXISTS MovieDirectors CASCADE;
DROP TABLE IF EXISTS ZipState CASCADE;
DROP TABLE IF EXISTS ZipCity CASCADE ;
DROP TABLE IF EXISTS StateCountry CASCADE;


-- Zip -- 
CREATE TABLE ZipState (ZipStateID    	integer    PRIMARY KEY,
					   ZipCode			real	not null,
					   State			text
					 );
					 
-- StateCountry -- 
CREATE TABLE StateCountry (StateCountryID	integer  PRIMARY KEY, 
						   StateName		text, 
						   CountryName      text
						  ); 
						  
-- Zip City -- 
CREATE TABLE ZipCity (ZipCityID             integer   PRIMARY KEY, 
				         ZipCode			int, 
				         CityName			text
				        ); 
-- People -- 
CREATE TABLE People (	
					 PID			        integer	PRIMARY KEY,
					 FirstName				text	not null,
					 LastName				text,
					 StreetAddress       	varchar	not null,
					 ZipStateID	       		int	  	not null	 references ZipState(ZipStateID),
					 ZipCityID				int   	not null    references ZipCity(ZipCityID),
					 StateCountryID			int 	not null    references StateCountry(StateCountryID),
					 Married		        bool, 
					 Actor					bool,
					 Director 		        bool 
					);


-- Actors --
CREATE TABLE Actors (
					 PID				int		not null	references People(PID),
					 Birthday 			int, 
					 HairColour			text,
					 EyeColour			text,
					 HeightInch			int,
					 WeightLBS			int,
					 FavColour			text,
					 SAGuildAnnivDate	int,
				         primary key(PID)
					); 
				
-- Spouses -- 
CREATE TABLE Spouses (
					   PID					int		not null	unique	references People(PID),
					   SpousesFN		text,
					   SpousesLN		text,
					primary key(PID) 
					 ); 
					 
-- Movies -- 
CREATE TABLE Movies(
					MovieID					int		PRIMARY KEY,
					Name					text	not null,
					YearReleased			        int,
					MPAANumber				int,
					DomestBoxSalesUSD							numeric(9,0),
					DVDBluRaySales							    numeric(9,0),
					ForeignBoxSalesUSD							numeric(9,0)
				    );
				
-- Directors -- 
CREATE TABLE Directors(
					   PID					int	references People(PID),
					   FilmSchool			text,
					   SAGuildAnnivDate		int,
					   FavLenseMaker 		text, 
					primary key(PID) 
					   ); 
					 
-- Movie Directors -- 
CREATE TABLE MovieDirectors (
						   	MovieID			int		not null	references Movies(MovieID),
						     DirectorPID	int 	not null	references Directors(PID)
    						);
                            
    						
-- Movie Actors -- 
CREATE TABLE MovieActors (
							MovieID int	not null	references Movies(MovieID),
							ActorPID int not null references Actors(PID)
							);
                   
                   
                   




    