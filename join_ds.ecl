import $;

EXPORT join_ds := MODULE
  hubs := $.record_raw.hubs;
  payments := $.record_raw.payments;
  stores := $.record_raw.stores;
  deliveries := $.record_raw.deliveries;
  drivers := $.record_raw.drivers;
  channels := $.record_raw.channels;
  orders := $.record_raw.orders;

  joineds1 := JOIN(orders,stores,LEFT.store_id=RIGHT.store_id);
  joineds2 := JOIN(joineds1,hubs,LEFT.hub_id=RIGHT.hub_id);

  joineds3 := JOIN(joineds2,payments,LEFT.payment_order_id=RIGHT.payment_order_id);

  joineds4 := JOIN(joineds3,deliveries,LEFT.delivery_order_id=RIGHT.delivery_order_id);
  joineds5 := JOIN(joineds4,drivers,LEFT.driver_id=RIGHT.driver_id);

  joineds6 := JOIN(joineds5,channels,LEFT.channel_id=RIGHT.channel_id);

  OUTPUT(joineds6)
  
  EXPORT df:=DATASET('~DeliveryCenter::df.csv',join_ds,CSV(heading(1)));
END;
  