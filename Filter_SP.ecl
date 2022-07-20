IMPORT $;

EXPORT Filter_SP := MODULE
  
  File := $.join_ds.joineds;
  IsSPAndNotOutlier := File.hub_state = 'SP' AND File.delivery_distance_meters <= 6800 AND File.order_amount <= 300 AND 
                        File.order_delivery_cost <= 14 AND File.payment_amount <= 300 AND File.payment_fee <= 8 AND 
                        File.delivery_status = 'DELIVERED' AND File.order_status = 'FINISHED' AND File.payment_status = 'PAID';
                        
  EXPORT sp_data := File(IsSPAndNotOutlier);

  EXPORT out := OUTPUT(sp_data,, '~delivery_center::rgr::sp_data',overwrite);

END;


