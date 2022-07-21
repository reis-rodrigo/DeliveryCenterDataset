IMPORT $;

EXPORT score_table := MODULE
  dataframe := $.join_data_theft.joineds;
  rel := $.relevo_record.relevo;

  hubs := RECORD
    dataframe.hub_name;
    dataframe.hub_id;
    dataframe.hub_latitude;
    dataframe.hub_longitude;
    dataframe.rentability;
  END;

  score_table := TABLE(dataframe, hubs);

  hubs MyTransf(hubs Le, hubs Ri) := TRANSFORM
    SELF.hub_name := Le.hub_name;
    SELF.hub_id := Le.hub_id;
    SELF.hub_latitude := Le.hub_latitude;
    SELF.hub_longitude := Le.hub_longitude;
    SELF.rentability := Le.rentability + Ri.rentability;
  END;

  r := ROLLUP(score_table, LEFT.hub_name = RIGHT.hub_name, MyTransf(LEFT, RIGHT));


  safety_rec := RECORD
    dataframe.hub_id;
    dataframe.criminality_index
    // REAL safety;
  END;

  // safety_rec MyTransf2(dataframe Le) := TRANSFORM
    // SELF.safety := 1 - Le.criminality_index;
    // SELF.hub_id := Le.hub_id;
  // END;

  score_table2 := TABLE(dataframe, safety_rec);


  s := SORT(score_table2, hub_id);
  d := DEDUP(s, LEFT.hub_id = RIGHT.hub_id);

  max_rent := MAX(r, r.rentability);
  min_rent := MIN(r, r.rentability);

  hubs MyTransf3(hubs Le) := TRANSFORM
    SELF.rentability := (Le.rentability-min_rent)/(max_rent-min_rent);
    SELF := Le;
  END;

  r2 := PROJECT(r, MyTransf3(LEFT));


  rec_joiner := RECORD
    r2;
    d;
  END;

  rec_joiner joiner(r2 Le, d Ri) := TRANSFORM
    SELF := Le;
    SELF := Ri;
  END;

  joineds := JOIN(r2,d,LEFT.hub_id=RIGHT.hub_id, joiner(LEFT, RIGHT));



  rec_joiner2 := RECORD
    joineds;
    rel;
  END;

  rec_joiner2 joiner2(joineds Le, rel Ri) := TRANSFORM
    SELF := Le;
    SELF := Ri;
  END;

  EXPORT joineds2 := JOIN(joineds,rel,LEFT.hub_name=RIGHT.hub_name, joiner2(LEFT, RIGHT));
  
  // OUTPUT(joineds2);
  
  rec_name := RECORD
    STRING real_name;
    UNSIGNED2 hub_id;
  END;
  
  ds := DATASET([{'Shopping Patio Paulista', 25}, {'Mooca Plaza Shopping', 33}, {'Shopping D', 55}, {'Shopping Jardim Sul', 31}, {'Shopping Metro Tatuape', 86},
                  {'Shopping Vila Olimpia', 28}, {'Shopping Center Norte', 85}, {'Tiete Plaza Shopping', 37}, {'Morumbi Shopping', 27}, {'Shopping Metro Santa Cruz', 17},
                  {'Shopping Cidade Sao Paulo', 26}, {'Shopping Analia Franco', 29}, {'Regiao de Restaurantes', 21}], rec_name);

                  
  ds_real_name := RECORD
    rec_name;
    joineds2;
  END;

  ds_real_name name_adder(joineds2 Le, rec_name Ri) := TRANSFORM
    SELF.real_name := Ri.real_name;
    SELF := Le;
    
  END;

  EXPORT final := JOIN(joineds2,ds,LEFT.hub_id=RIGHT.hub_id, name_adder(LEFT, RIGHT));

  
  
END;
