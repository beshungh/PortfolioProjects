SELECT *
FROM CovidDeaths
ORDER BY 3,4

SELECT *
FROM CovidVaccinations
ORDER BY 3,4

--USING THE COVID DEATHS TABLE

--The time period covered by the CovidDeath
/*The query retrieves the minimum and maximum dates from the CovidDeaths table. */

SELECT MIN(date) AS start_date,Max(date) AS end_date
FROM CovidDeaths

--I then counted the number of observations in the CovidDeath table

SELECT COUNT(*) AS number_observation
FROM CovidDeaths

--Checking for missing values and their prevalence across variables
/* This query gathers information about the time period, number of observations, and missing values in your dataset. */

SELECT 'Population' AS variable,COUNT(*) - COUNT(population) AS missing_count,(COUNT(*) - COUNT(population)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Total_cases' AS variable,COUNT(*) - COUNT(total_cases) AS missing_count,(COUNT(*) - COUNT(total_cases)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_cases' AS variable,COUNT(*) - COUNT(new_cases) AS missing_count,(COUNT(*) - COUNT(new_cases)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_cases_smoothed' AS variable,COUNT(*) - COUNT(New_cases_smoothed) AS missing_count,(COUNT(*) - COUNT(New_cases_smoothed)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Total_deaths' AS variable,COUNT(*) - COUNT(Total_deaths) AS missing_count,(COUNT(*) - COUNT(Total_deaths)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_deaths' AS variable,COUNT(*) - COUNT(New_deaths) AS missing_count,(COUNT(*) - COUNT(New_deaths)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_deaths_smoothed' AS variable,COUNT(*) - COUNT(New_deaths_smoothed) AS missing_count,(COUNT(*) - COUNT(New_deaths_smoothed)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Total_cases_per_million' AS variable,COUNT(*) - COUNT(Total_cases_per_million) AS missing_count,(COUNT(*) - COUNT(Total_cases_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_cases_per_million' AS variable,COUNT(*) - COUNT(New_cases_per_million) AS missing_count,(COUNT(*) - COUNT(New_cases_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_cases_smoothed_per_million' AS variable,COUNT(*) - COUNT(New_cases_smoothed_per_million) AS missing_count,(COUNT(*) - COUNT(New_cases_smoothed_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Total_deaths_per_million' AS variable,COUNT(*) - COUNT(Total_deaths_per_million) AS missing_count,(COUNT(*) - COUNT(Total_deaths_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_deaths_per_million' AS variable,COUNT(*) - COUNT(New_deaths_per_million) AS missing_count,(COUNT(*) - COUNT(New_deaths_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'New_deaths_smoothed_per_million' AS variable,COUNT(*) - COUNT(New_deaths_smoothed_per_million) AS missing_count,(COUNT(*) - COUNT(New_deaths_smoothed_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Reproduction_rate' AS variable,COUNT(*) - COUNT(Reproduction_rate) AS missing_count,(COUNT(*) - COUNT(Reproduction_rate)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'ICU_patients' AS variable,COUNT(*) - COUNT(ICU_patients) AS missing_count,(COUNT(*) - COUNT(ICU_patients)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'ICU_patients_per_million' AS variable,COUNT(*) - COUNT(ICU_patients_per_million) AS missing_count,(COUNT(*) - COUNT(ICU_patients_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Hosp_patients' AS variable,COUNT(*) - COUNT(Hosp_patients) AS missing_count,(COUNT(*) - COUNT(Hosp_patients)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Hosp_patients_per_million' AS variable,COUNT(*) - COUNT(Hosp_patients_per_million) AS missing_count,(COUNT(*) - COUNT(Hosp_patients_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Weekly_ICU_admissions' AS variable,COUNT(*) - COUNT(Weekly_ICU_admissions) AS missing_count,(COUNT(*) - COUNT(Weekly_ICU_admissions)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Weekly_ICU_admissions_per_million' AS variable,COUNT(*) - COUNT(Weekly_ICU_admissions_per_million) AS missing_count,(COUNT(*) - COUNT(Weekly_ICU_admissions_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Weekly_hosp_admissions' AS variable,COUNT(*) - COUNT(Weekly_hosp_admissions) AS missing_count,(COUNT(*) - COUNT(Weekly_hosp_admissions)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
UNION
SELECT 'Weekly_hosp_admissions_per_million' AS variable,COUNT(*) - COUNT(Weekly_hosp_admissions_per_million) AS missing_count,(COUNT(*) - COUNT(Weekly_hosp_admissions_per_million)) /COUNT(*) * 100 AS missing_percentage
FROM CovidDeaths
ORDER BY variable 

--Statistics for Numeric Variables
/*  This query provides aggregated statistics for CovidDeaths metrics for different locations, considering only rows where the 'continent' column is not NULL. 
    The output includes the location, average new cases, minimum new cases, maximum new cases. */

SELECT location,
ROUND(AVG(new_cases),2) AS avg_new_cases,
MIN(new_cases) AS min_new_cases,
MAX(new_cases) AS max_new_cases,

ROUND(AVG(CONVERT(FLOAT,total_cases)),2) AS avg_new_cases,
MIN(CONVERT(FLOAT,total_cases)) AS min_new_cases,
MAX(CONVERT(FLOAT,total_cases)) AS max_new_cases,
 
ROUND(AVG(CONVERT(FLOAT,new_deaths)),2) AS avg_total_deaths,
MIN(CONVERT(FLOAT,new_deaths)) AS min_total_deaths,
MAX(CONVERT(FLOAT,new_deaths)) AS max_total_deaths,

ROUND(AVG(CONVERT(FLOAT,total_deaths)),2) AS avg_total_deaths,
MIN(CONVERT(FLOAT,total_deaths)) AS min_total_deaths,
MAX(CONVERT(FLOAT,total_deaths)) AS max_total_deaths,

ROUND(AVG(CONVERT(FLOAT,weekly_hosp_admissions)),2) AS avg_weekly_hosp_admissions,
MIN(CONVERT(FLOAT,weekly_hosp_admissions)) AS min_weekly_hosp_admissions,
MAX(CONVERT(FLOAT,weekly_hosp_admissions)) AS max_weekly_hosp_admissions,

ROUND(AVG(CONVERT(FLOAT,hosp_patients)),2) AS avg_hosp_patients,
MIN(CONVERT(FLOAT,hosp_patients)) AS min_hosp_patients,
MAX(CONVERT(FLOAT,hosp_patients)) AS max_hosp_patients,

ROUND(AVG(CONVERT(FLOAT,weekly_icu_admissions)),2)AS avg_weekly_icu_admissions,
MIN(CONVERT(FLOAT,weekly_icu_admissions)) AS min_weekly_icu_admissions,
MAX(CONVERT(FLOAT,weekly_icu_admissions)) AS max_weekly_icu_admissions,

ROUND(AVG(CONVERT(FLOAT,icu_patients)),2) AS avg_hosp_patients,
MIN(CONVERT(FLOAT,icu_patients)) AS min_hosp_patients,
MAX(CONVERT(FLOAT,icu_patients)) AS max_hosp_patients,

ROUND(AVG(CONVERT(FLOAT,hosp_patients)),2) AS avg_hosp_patients,
MIN(CONVERT(FLOAT,hosp_patients)) AS min_hosp_patients,
MAX(CONVERT(FLOAT,hosp_patients)) AS max_hosp_patients
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY location ASC

--This query analyse trends in the number of new cases and deaths over TIME,and to identify potential seasonal patterns or cycles in the data.
/*The query sums up new cases and deaths for each date, allowing me to observe trends over time.*/

SELECT date,SUM(new_cases) AS new_cases,SUM(CONVERT(FLOAT,new_deaths)) AS total_death
FROM CovidDeaths
GROUP BY date
ORDER BY date ASC

--This query identify potential seasonal patterns,it extracts the month from the date and calculates the average new cases and deaths for each month.
/*The query extracts the month from the date and calculates the average new cases and deaths for each month. */

SELECT EXTRACT(MONTH FROM date) AS month,AVG(new_cases) AS avg_total_cases,AVG(new_deaths) AS avg_total_death
FROM CovidDeaths
GROUP BY month
ORDER BY month

--Variation in New Cases and Deaths
/* To analyze how new cases and deaths vary across different regions or countries and to identify notable differences in per million metrics
   This query sums up new cases and total deaths for each COUNTRY, providing an overview of how they vary */

SELECT location,SUM(new_cases) AS total_new_cases,SUM(CONVERT(FLOAT,total_deaths)) AS total_deaths
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_new_cases DESC


/*This query calculates average new cases and deaths per population for each country. */

SELECT location,AVG(new_cases / population) AS avg_new_cases_per_population,AVG(total_deaths / population) AS avg_deaths_per_population
FROM CovidDeaths
GROUP BY location
ORDER BY avg_new_cases_per_population DESC


--Variation in Reproduction Rate Over Time
/* This query calculates the average reproduction rate for each date, providing an overview of how it varies over time */

SELECT date,ROUND(AVG(CONVERT(FLOAT,reproduction_rate)),2) AS avg_reproduction_rate
FROM CovidDeaths
GROUP BY date
ORDER BY date ASC

--Correlation between Reproduction Rate and New Cases
/* This query calculates both the average reproduction rate and the total new cases for each date. */

SELECT date,ROUND(AVG(CONVERT(FLOAT,reproduction_rate)),2) AS avg_reproduction_rate,SUM(new_cases) AS total_new_cases
FROM CovidDeaths
GROUP BY date
ORDER BY date ASC


--Analysing how ICU and hospital admissions change over time and to explore the relationship between new cases and the strain on the healthcare system
/*ICU and Hospital Admissions Over Time. This query calculates the average number of ICU patients and hospital patients for each date, providing an overview of how these admissions change over time. */

SELECT date, ROUND(AVG(CONVERT(FLOAT,icu_patients)),2) AS avg_icu_patients,ROUND(AVG(CONVERT(FLOAT,hosp_patients)),2) AS avg_hosp_patients
FROM CovidDeaths
GROUP BY date
ORDER BY date ASC

--Relationship Between New Cases and Healthcare System Strain
/* This query calculates the average number of new cases, ICU patients, and hospital patients for each date. 
   By examining the results, you can visually assess whether there is a relationship between new cases and the strain on the healthcare system. */

SELECT date,ROUND(AVG(new_cases),2) AS avg_new_cases,ROUND(AVG(CONVERT(FLOAT,icu_patients)),2) AS avg_icu_patients,ROUND(AVG(CONVERT(FLOAT,hosp_patients)),2) AS avg_hosp_patients
FROM CovidDeaths
GROUP BY date
ORDER BY date ASC

--To analyse differences in ICU and hospital metrics when comparing different regions or countries
/* Differences in ICU and Hospital Metrics Across Regions or Countries.
   This query calculates the average number of ICU patients and hospital patients for each country, allowing you to compare the metrics across different regions or countries. */

SELECT location,ROUND(AVG(CONVERT(FLOAT,icu_patients)),2) AS avg_icu_patients,ROUND(AVG(CONVERT(FLOAT,hosp_patients)),2) AS avg_hosp_patients
FROM CovidDeaths
GROUP BY location
ORDER BY avg_icu_patients DESC, avg_hosp_patients DESC

--USING THE COVID VACCINATIONS TABLE

--The total number of tests conducted globally between 2020-01-01 to 2023-12-30

SELECT date, SUM(CONVERT(FLOAT,total_tests)) AS total_tests_conducted
FROM CovidVaccinations
WHERE date BETWEEN '2020-01-01' AND '2023-12-30'
GROUP BY date
ORDER BY date ASC

--Countries with the highest total vaccinations per hundred people

SELECT iso_code,location, MAX(total_vaccinations_per_hundred) AS max_vaccinations_per_hundred
FROM CovidVaccinations
GROUP BY iso_code, location
ORDER BY max_vaccinations_per_hundred DESC

--People that have been fully vaccinated in each continent

SELECT continent, SUM(CONVERT(FLOAT,people_fully_vaccinated)) AS total_people_fully_vaccinated
FROM CovidVaccinations
--WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY continent ASC

--People that have been fully vaccinated in each Location

SELECT location, SUM(CONVERT(FLOAT,people_fully_vaccinated)) AS total_people_fully_vaccinated
FROM CovidVaccinations
--WHERE continent IS NOT NULL
GROUP BY location
ORDER BY location ASC

--I Selected the Data i will be using,breaking it down by Location.

SELECT location,date,population,total_cases,new_cases,total_deaths
FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2 --The 1 and 2 Correspond to the position of the column Location and Date in the SELECT statement.

/* I looked at the Total Cases Vrs Total Deaths to know how many cases were recorded
   in a country and how many death were recorded from those cases,this insight made me know the likelihood of dying if you contract covid in your country, in this case i used Ghana */

SELECT location,total_cases,total_deaths,(CONVERT(float,total_deaths) / NULLIF(CONVERT(float,total_cases),0))*100  AS DeathPercentage /* I used this script to avoid division by zero,if total_cases is 0,it will return NULL,otherwise,it will return the converted value of total_cases */
FROM CovidDeaths
--WHERE location LIKE '%Ghana%' AND continent IS NOT NULL
ORDER BY 1,2 

--Looking at Total Cases Vrs Population.I wanted to see the percentage of poplulation that has gotten covid.

SELECT location,date,Population,total_cases,(CONVERT(float,total_cases) / NULLIF(CONVERT(float,Population),0))*100  AS PercentPopulationInfected /* I used this script to avoid division by zero,if total_cases is 0,it will return NULL,otherwise,it will return the converted value of total_cases */
FROM CovidDeaths
--WHERE location LIKE '%Ghana%' 
WHERE continent IS NOT NULL
ORDER BY 1,2

--Looking at Countries with Highest Infection Rate compared to population.

SELECT location,population,MAX(CONVERT(float,total_cases)) AS HighestInfectionCount,  MAX((NULLIF(CONVERT(float,total_cases/Population),0)))*100  AS PercentPopulationInfected 
FROM CovidDeaths
--WHERE location LIKE '%Ghana%'
WHERE continent IS NOT NULL
GROUP BY location,Population
ORDER BY PercentPopulationInfected DESC

--Showing Countries with Highest Death Count per Population

SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
--WHERE location LIKE '%Ghana%' 
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC


 --BREAK DOWN BY CONTINENTS

 --Showing the Continents with the Highest Death Count per population

 SELECT continent, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
--WHERE location LIKE '%Ghana%' 
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC


/*GLOBAL NUMBERS.

This query retrieves information about total cases, total deaths, and death percentage for each date, considering only records with a non-null continent. 
The results are then grouped by date and ordered accordingly. 
The NULLIF function is used to handle potential division by zero scenarios in the calculation of the death percentage.*/

SELECT date,SUM(new_cases) AS total_cases,SUM(new_deaths) AS total_death,NULLIF(SUM(new_deaths),0)/NULLIF(SUM(new_cases),0)* 100 AS DeathPercentage 
FROM CovidDeaths
--WHERE location LIKE '%Ghana%' 
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2


/* This query calculates the total number of new cases and deaths, computes the death percentage as at {2023-12-23}, and then filters the results to include only rows where the continent is not NULL. 
   The final result set is ordered by total cases and total deaths. */

SELECT SUM(new_cases) AS total_cases,SUM(new_deaths) AS total_death,SUM(new_deaths)/NULLIF(SUM(new_cases),0)* 100 AS DeathPercentage
FROM CovidDeaths
--WHERE location LIKE '%Ghana%' 
WHERE continent IS NOT NULL
ORDER BY 1,2 

 --Looking at Total Population Vrs Vaccinations(The Total Amount of People in the World that has been Vaccinated).
   
 --Rolling Count
/* This query retrieves information about new vaccinations along with the cumulative sum of vaccinations over time for each location.
   The cumulative sum resets for each unique location, and the results are ordered by location and date. 
   The CONVERT(float, ...) part is used to ensure that the new_vaccinations column is treated as a float for accurate sum calculations. */

SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location,CovidDeaths.date) AS RollingPeopleVaccinated --I Partition it by Location because I wanted the count to start over every time i get to a new Location.
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL 
ORDER BY 2,3

--Total Population Vrs Vaccinations

/* The query is retrieving data from two tables, CovidDeaths and CovidVaccinations, where there is matching information based on the location and date columns.
   The result set include columns from both tables for the rows that meet the specified conditions.
   I used the INNER JOIN to combine the rows based on matching location and date.
   To calculate the rolling sum of new vaccinations over time. I used the PARTITION BY clause to reset the sum for each unique CovidDeaths.location. 
   The ORDER BY clause within the OVER clause specifies the order in which the sum is calculated. 
   The GROUP BY clause,groups the result set based on specified columns.I included CovidDeaths.date in the GROUP BY clause, ensuring that the rolling sum is calculated over time.
   The ORDER BY clause Orders the result set based on the second and third columns */

SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location,CovidDeaths.date) AS RollingPeopleVaccinated,
(RollingPeopleVaccinated/CovidDeaths.population)*100 --There is an error here.
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL 
GROUP BY CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,CovidDeaths.date
ORDER BY 2,3

/* It seems that there is an issue with the query related to referencing the RollingPeopleVaccinated alias in the commented-out portion of the query above.
   SQL cannot reference column aliases defined in the SELECT clause in other parts of the same query, particularly in the same logical query processing phase.
   To address this,I can repeat the expression used to calculate the rolling sum instead of using the alias OR use a subquery or a Common Table Expression (CTE) or Temp table to calculate the rolling sum, and then reference the alias in the outer query. 
   This would allow me to use the alias in the commented-out portion. */
 
 --REPEATING THE EXPRESSION

SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location,CovidDeaths.date) AS RollingPeopleVaccinated,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location, CovidDeaths.date) / CovidDeaths.population * 100 AS PercentPopulationVaccinated
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL 
GROUP BY CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,CovidDeaths.date
ORDER BY 2,3

--USING SUBQUERY
/* A subquery is used to aggregate and process data before presenting the final result. 
   This query calculates the cumulative sum of new vaccinations over time for each location, using the SUM window function with the PARTITION BY clause. */

SELECT *,(RollingPeopleVaccinated / population) * 100 AS PercentPopulationVaccinated
FROM (SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float, CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location, CovidDeaths.date) AS RollingPeopleVaccinated
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL
GROUP BY CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,CovidDeaths.date) AS SUBQUERY --Removing the AS SUBQUERY causes the query to stop working,this is possible because Microsoft SQL Server is sensitive to the absence of an alias for subqueries as compared to other databases system.
ORDER BY 2,3

/*USING CTE(Common Table Expression),the CTE PopulationVrsVaccinations calculates the rolling sum of new vaccinations over time for each location, considering the specified grouping and partitioning. 
 The main query then uses this CTE to select the results and calculates the percentage of the population vaccinated based on the rolling sum and the population. */

WITH PopulationVrsVaccinations(Continent,Location,Date,Population,new_vaccinations,RollingPeopleVaccinated)
AS 
(
SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location,CovidDeaths.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL 
GROUP BY CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,CovidDeaths.date
--ORDER BY 2,3
)
SELECT *, (RollingPeopleVaccinated/population)*100 AS PercentPopulationVaccinated
FROM PopulationVrsVaccinations

-- USING TEMP TABLE
/* This script creates a temporary table, inserts data into it while calculating the rolling sum of new vaccinations, 
   and finally calculates the percentage of the population vaccinated based on the cumulative sum and population. 
   The results are ordered by location and date. */

DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent NVARCHAR(255),
Location NVARCHAR(255),
Date DATETIME,
Population NUMERIC,
New_vaccinations NUMERIC,
RollingPeopleVaccinated NUMERIC
)

INSERT INTO #PercentPopulationVaccinated
SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location,CovidDeaths.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL 
GROUP BY CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,CovidDeaths.date
--ORDER BY 2,3

SELECT *,(RollingPeopleVaccinated / NULLIF(Population,0))*100 AS PercentPopulationVaccinated
FROM #PercentPopulationVaccinated
ORDER BY 2,3


--CREATING VIEW TO STORE DATA FOR LATER VISUALIZATIONS 

 CREATE VIEW PercentPopulationVaccinated AS 
 SELECT CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,
SUM(CONVERT(float,CovidVaccinations.new_vaccinations)) OVER (PARTITION BY CovidDeaths.location ORDER BY CovidDeaths.location,CovidDeaths.date) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM CovidDeaths
INNER JOIN CovidVaccinations
ON CovidDeaths.location = CovidVaccinations.location
AND CovidDeaths.date = CovidVaccinations.date
WHERE CovidDeaths.continent IS NOT NULL 
GROUP BY CovidDeaths.continent,CovidDeaths.location,CovidVaccinations.date,CovidDeaths.population,CovidVaccinations.new_vaccinations,CovidDeaths.date
--ORDER BY 2,3

SELECT *
FROM PercentPopulationVaccinated