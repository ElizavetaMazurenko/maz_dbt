{%-macro limit_data_in_dev(column, days=1000)-%}
{%-if target.name == 'development'%}
where {{column}} >= current_timestamp - ({{days}}*interval '1 day')
-- добавляет(вычитает) к 3 аргументу (дате) 
-- столько дней (если первый аргумент day) сколько в 2 аргументе
{%-endif-%}
{%-endmacro%}