procedure(make_list(start stop interval)
my_list='();
point=(stop-start)/interval
point=round(point);

for( i 0 point
val=list(i*interval+start);
my_list=append(my_list val);
)

my_list;
)
