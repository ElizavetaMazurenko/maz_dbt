{%macro cents_to_dollars(column, decimal_digits=2)%}
 round(1.0*{{column}} / 100, {{decimal_digits}})
{%endmacro%}