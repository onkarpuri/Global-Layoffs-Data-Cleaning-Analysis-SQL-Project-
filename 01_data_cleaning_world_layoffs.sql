# data cleaning

select *
from layoffs;

# 1. remove duplicates
# 2. standardize the data
# 3. null values or blank values
# 4. remove any unnecessary columns/rows


create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select * 
from layoffs;

#duplicatses `

#sel ect *,
#row_number() over(
#partition by (company, industry, total_laid_off, percentage_laid_off,`date`) as row_num
#from layoffs_staging


with duplicate_cte as
(
select *,
row_number() over(
partition by company,location,stage,country,funds_raised_millions, industry, total_laid_off, percentage_laid_off,`date`) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num>1;

select *
from layoffs_staging
where company = 'casper'
;

with duplicate_cte as
(
select *,
row_number() over(
partition by company,location,stage,country,funds_raised_millions, industry, total_laid_off, percentage_laid_off,`date`) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num>1; # you can not update or delete ,same thing in cte




CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number() over(
partition by company,location,stage,country,funds_raised_millions, industry, total_laid_off, percentage_laid_off,`date`) as row_num
from layoffs_staging;

select *
from layoffs_staging2
where row_num>1
;

delete 
from layoffs_staging2
where row_num>1
;

select *
from layoffs_staging2
where row_num>1
;

select *
from layoffs_staging2
;


#standardizing data - finding issues in data and fixing it

select company, trim(company)
from layoffs_staging2
;

update layoffs_staging2
set company=trim(company)
;

select *
from layoffs_staging2
where industry like 'crypto%'
;

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'united states%';

select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_staging2
;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2;

#removing nulls and blank values

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null
;
update layoffs_staging2
set industry =null
where industry = ''
;
select *
from layoffs_staging2
where industry is null 
or industry = ''
;
select *
from layoffs_staging2
where company = 'airbnb';

select t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
  on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
  on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null)
and t2.industry is not null;

select *
from layoffs_staging2
where company like 'bally%';

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null
;

alter table layoffs_staging2
drop column row_num;