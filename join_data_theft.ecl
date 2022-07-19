IMPORT $;

EXPORT join_data_theft := MODULE
  rec_theft := $.theft_index.new_Layout;
  theft := $.theft_index.theft_index_value;
  rec_df := $.table_sp.df_final_columns_rec;
  df := $.table_sp.df;
  
  outrec1 := RECORD
    rec_theft;
    rec_df;
  END;

  outrec1 Mytransf(rec_theft Le, rec_df Ri) := TRANSFORM
    SELF := Le;
    SELF := Ri;
  END;


  EXPORT joineds := JOIN(theft,df,LEFT.hub_name=RIGHT.hub_name, Mytransf(LEFT, RIGHT));
  
  EXPORT out := OUTPUT(joineds,, '~delivery_center::rgr::joined_dataset_theft',overwrite);
END;