IMPORT $;



EXPORT Filter_SP := MODULE
  
  File := $.join_ds.joineds;
  EXPORT sp_data := File(hub_state = 'SP');
  // COUNT(File(hub_state = 'SP'));

  EXPORT out := OUTPUT(sp_data,, '~delivery_center::rgr::sp_data',overwrite);

END;