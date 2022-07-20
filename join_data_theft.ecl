IMPORT $;

EXPORT join_data_theft := MODULE
  rec_theft := $.theft_index.new_Layout;
  theft := $.theft_index.theft_index_value;
  rec_df := $.rent_record.new_Layout;
  df := $.rent_record.rentability;
  
  
  outrec1 := RECORD
    rec_theft;
    rec_df;
    REAL score;
  END;

  outrec1 Mytransf(rec_theft Le, rec_df Ri) := TRANSFORM
    SELF := Le;
    SELF := Ri;
    SELF.score := 1;
  END;


  EXPORT joineds := JOIN(theft,df,LEFT.hub_name=RIGHT.hub_name, Mytransf(LEFT, RIGHT));
  
  EXPORT out := OUTPUT(joineds,, '~delivery_center::rgr::joined_dataset_theft',overwrite);
END;