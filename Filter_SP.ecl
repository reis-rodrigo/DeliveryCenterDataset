IMPORT $;



EXPORT Filter_SP := MODULE
  
  File := $.join_ds.joineds;
  IsSPAndNotOutlier := File.hub_state = 'SP' AND File.delivery_distance_meters <= 6800 AND File.order_amount <= 300 AND 
                        File.order_delivery_cost <= 14 AND File.payment_amount <= 300 AND File.payment_fee <= 8;
  EXPORT sp_data := File(IsSPAndNotOutlier);
  // COUNT(File(hub_state = 'SP'));

  EXPORT out := OUTPUT(sp_data,, '~delivery_center::rgr::sp_data',overwrite);

END;
