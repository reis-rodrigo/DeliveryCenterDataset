IMPORT $;

dataframe := $.join_data_theft.joineds;

hubs := RECORD
  dataframe.hub_name;
  dataframe.hub_id;
  dataframe.hub_latitude;
  dataframe.hub_longitude;
  dataframe.score;
END;

score_table := TABLE(dataframe, hubs);

s := SORT(score_table, hub_name);
d := DEDUP(s, LEFT.hub_name = RIGHT.hub_name);
OUTPUT(d)
