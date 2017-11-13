                   
 -- SAMPLE DATA FOR THE ABOVE --

						
-- State Country -- 
insert into StateCountry(StateCountryID, StateName, CountryName) values
						(08807, 'California', 'USA'); 		
insert into StateCountry(StateCountryID, StateName, CountryName) values
						(08808, 'Idaho', 'USA'); 						
insert into StateCountry(StateCountryID, StateName, CountryName) values
						(08800, 'Penn', 'USA'); 						
insert into StateCountry(StateCountryID, StateName, CountryName) values
						(08801, 'Maine', 'USA'); 
						
-- Zip State -- 
insert into ZipState (ZipStateID, ZipCode, State) values 
					(18809, 01, 'California') ;	
insert into ZipState (ZipStateID, ZipCode, State) values 
					(18802, 01, 'California') ;							
insert into ZipState (ZipStateID, ZipCode, State) values 
					(18803, 01, 'California') ;	
insert into ZipState (ZipStateID, ZipCode, State) values 
					(18804, 01, 'California') ;	
					
-- ZipCity -- 	
insert into ZipCity(ZipCityID, ZipCode, CityName) values
					(01, 01,'Los Angeles') ;
insert into ZipCity(ZipCityID, ZipCode, CityName) values
					(02, 01,'Los Angeles') ;					
insert into ZipCity(ZipCityID, ZipCode, CityName) values
					(03, 01,'Los Angeles') ;					
insert into ZipCity(ZipCityID, ZipCode, CityName) values
					(04, 01,'Los Angeles') ;	
                    
-- People --
insert into People(pid, FirstName, LastName, StreetAddress, ZipStateID, ZipCityID, StateCountryID, Married, Actor, Director) values 
					(9, 'Roger', 'Moore', '131 Rodeo Drive', 18802, '01', '08807', true, true, false);
insert into People(PID, FirstName, LastName, StreetAddress, ZipStateID, ZipCityID, StateCountryID, Married, Actor, Director) values 
					(8, 'Not', 'Me', '121 Rodeo Drive', 18803, '02', '08807', true, false, true);
insert into People(PID, FirstName, LastName, StreetAddress, ZipStateID, ZipCityID, StateCountryID, Married, Actor, Director) values 
					(7, 'Actor', 'Guy', '111 Rodeo Drive', 18804, '03', '08807', true, true, false);
insert into People(PID, FirstName, LastName, StreetAddress, ZipStateID, ZipCityID, StateCountryID, Married, Actor, Director) values 
					(6, 'Actor', 'Girl', '101 Rodeo Drive', 18809, '04', '08807', true, false, true);
					
-- Actors -- 
insert into Actors(PID, Birthday, HairColour, EyeColour, HeightInch, WeightLBS, FavColour, SAGuildAnnivDate) values
					(9, 04301996, 'brown', 'green', 65, 105, 'pink', 1212012) ;
insert into Actors(PID, Birthday, HairColour, EyeColour, HeightInch, WeightLBS, FavColour, SAGuildAnnivDate) values
					(7, 05301996, 'black', 'blue', 65, 106, 'blue', 1212012) ;



-- Directors -- 
insert into Directors(PID, FilmSchool, SAGuildAnnivDate, FavLenseMaker) values
						(8, 'Marist', 1212012, 'Alan') ;

insert into Directors(PID, FilmSchool, SAGuildAnnivDate, FavLenseMaker) values
						(6, 'SUNY', 1212014, 'Dennis') ;

														
-- Movies --
insert into Movies(MovieID, Name, YearReleased, MPAANumber, DomestBoxSalesUSD, DVDBluRaySales, ForeignBoxSalesUSD) values 
					(123, 'Bond', 2010, 112, 100000, 500, 900000);
insert into Movies(MovieID, Name, YearReleased, MPAANumber, DomestBoxSalesUSD, DVDBluRaySales, ForeignBoxSalesUSD) values 
					(345, 'James', 2011, 113, 200000, 5000, 700000);
insert into Movies(MovieID, Name, YearReleased, MPAANumber, DomestBoxSalesUSD, DVDBluRaySales, ForeignBoxSalesUSD) values 
					(567, 'JamesBond', 2014, 114, 300000, 50000, 800000);
insert into Movies(MovieID, Name, YearReleased, MPAANumber, DomestBoxSalesUSD, DVDBluRaySales, ForeignBoxSalesUSD) values 
					(789, 'JamesBondie', 2015, 115, 400000, 500000, 990000);
					
-- Spouses --
insert into Spouses(PID, SpousesFN, SpousesLN) values
					(9, 'Plain', 'Jane'); 
insert into Spouses(PID, SpousesFN, SpousesLN) values
					(8, 'Champagne', 'Puppa'); 			
insert into Spouses(PID, SpousesFN, SpousesLN) values
					(7, 'Post', 'Malone'); 	
insert into Spouses(PID, SpousesFN, SpousesLN) values
					(6, 'Rock', 'Star'); 				
					
-- Movie Actors --
insert into MovieActors(ActorPID,MovieID) values
						(9,789) ; 
insert into MovieActors(ActorPID,MovieID) values
						(7,345) ; 						
insert into MovieActors(ActorPID,MovieID) values
						(9,567) ; 						
						
						
-- Movie Directors -- 	

insert into MovieDirectors(MovieID, DirectorPID) values 
							(345, 8) ;							
					
insert into MovieDirectors(MovieID, DirectorPID) values 
							(789, 6) ;	
							
-------------------------------------------------
							
-- SQL QUERY --                    
Select FirstName, LastName
From People
Where PID in ( 
				SELECT DirectorPID
				FROM MovieDirectors 
									WHERE MovieId in (
									Select MovieID 
									From MovieActors
									where ActorPid in (
														Select PID 
                                        				From People 
														Where FirstName = 'Roger' 
                                       				and LastName = 'Moore'))) 
AND director = true ;

-----------------------------------------------------

﻿--Select *
--From MovieActors, MovieDirectors 
--Where movieactors.movieid = moviedirectors.movieid ; 

                            