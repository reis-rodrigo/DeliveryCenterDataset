IMPORT $;
EXPORT record_raw := MODULE
	EXPORT rec_hubs :=	RECORD
    STRING hub_id;
    STRING hub_name;
    STRING hub_city;
    STRING hub_state;
    STRING hub_latitude;
    STRING hub_longitude;
		// EXPORT Hubs:= DATASET('~DeliveryCenter::hubs.csv',hubs,CSV(heading(1)));
  END;
  EXPORT hubs:= DATASET('~delivery_center::rgr::hubs.csv',rec_hubs,CSV(heading(1)));
  
  EXPORT rec_payments :=	RECORD
    STRING payment_id;
    STRING payment_order_id;
    STRING payment_amount;
    STRING payment_fee;
    STRING payment_method;
    STRING payment_status;
		// EXPORT Payments:= DATASET('~DeliveryCenter::payments.csv',payments,CSV(heading(1)));
  END;
  EXPORT payments:= DATASET('~delivery_center::rgr::payments.csv',rec_payments,CSV(heading(1)));
  
  EXPORT rec_stores :=	RECORD
    STRING store_id;
    STRING hub_id;
    STRING store_name;
    STRING store_segment;
    STRING store_plan_price;
    STRING store_latitude;
    STRING store_longitude;
		// EXPORT Stores:= DATASET('~DeliveryCenter::stores.csv',stores,CSV(heading(1)));
  END;
  EXPORT stores:= DATASET('~delivery_center::rgr::stores.csv',rec_stores,CSV(heading(1)));
  
  EXPORT rec_deliveries :=	RECORD
    STRING delivery_id;
    STRING delivery_order_id;
    STRING driver_id;
    STRING delivery_distance_meters;
    STRING delivery_status;
		// EXPORT Deliveries:= DATASET('~DeliveryCenter::deliveries.csv',deliveries,CSV(heading(1)));
  END;
  EXPORT deliveries:= DATASET('~delivery_center::rgr::deliveries.csv',rec_deliveries,CSV(heading(1)));
  
  EXPORT rec_drivers :=	RECORD
    STRING driver_id;
    STRING driver_modal;
    STRING driver_type;
		// EXPORT Drivers:= DATASET('~DeliveryCenter::drivers.csv',drivers,CSV(heading(1)));
  END;
  EXPORT drivers:= DATASET('~delivery_center::rgr::drivers.csv',rec_drivers,CSV(heading(1)));
  
  EXPORT rec_channels :=	RECORD
    STRING channel_id;
    STRING channel_name;
    STRING channel_type;
		// EXPORT Channels:= DATASET('~DeliveryCenter::channels.csv',channels,CSV(heading(1)));
  END;
  EXPORT channels:= DATASET('~delivery_center::rgr::channels.csv',rec_channels,CSV(heading(1)));
  
  EXPORT rec_orders :=	RECORD
    STRING order_id;
    STRING store_id;
    STRING channel_id;
    STRING payment_order_id;
    STRING delivery_order_id;
    STRING order_status;
    STRING order_amount;
    STRING order_delivery_fee;
    STRING order_delivery_cost;
    STRING order_created_hour;
    STRING order_created_minute;
    STRING order_created_day;
    STRING order_created_month;
    STRING order_created_year;
    STRING order_moment_created;
    STRING order_moment_accepted;
    STRING order_moment_ready;
    STRING order_moment_collected;
    STRING order_moment_in_expedition;
    STRING order_moment_delivering;
    STRING order_moment_delivered;
    STRING order_moment_finished;
    STRING order_metric_collected_time;
    STRING order_metric_paused_time;
    STRING order_metric_production_time;
    STRING order_metric_walking_time;
    STRING order_metric_expedition_speed_time;
    STRING order_metric_transit_time;
    STRING order_metric_cycle_time;
		// EXPORT Orders:= DATASET('~DeliveryCenter::orders.csv',orders,CSV(heading(1)));
  END;
  EXPORT orders:= DATASET('~delivery_center::rgr::orders.csv',rec_orders,CSV(heading(1)));
END;

