IMPORT $;
EXPORT record_optimized := MODULE
	EXPORT rec_hubs :=	RECORD
    UNSIGNED1 hub_id;
    STRING16 hub_name;
    STRING14 hub_city;
    STRING2 hub_state;
    REAL8 hub_latitude;
    REAL8 hub_longitude;

		// EXPORT Hubs:= DATASET('~DeliveryCenter::hubs.csv',hubs,CSV(heading(1)));
  END;
  EXPORT hubs:= DATASET('~delivery_center::rgr::hubs.csv',rec_hubs,CSV(heading(1)));
  
  EXPORT rec_payments :=	RECORD
    UNSIGNED4 payment_order_id;
    UNSIGNED4 payment_id;
    REAL8 payment_amount;
    REAL4 payment_fee;
    STRING24 payment_method;
    STRING10 payment_status;

		// EXPORT Payments:= DATASET('~DeliveryCenter::payments.csv',payments,CSV(heading(1)));
  END;
  EXPORT payments:= DATASET('~delivery_center::rgr::payments.csv',rec_payments,CSV(heading(1)));
  
  EXPORT rec_stores :=	RECORD
    UNSIGNED2 store_id;
    UNSIGNED1 hub_id;
    STRING32 store_name;
    STRING4 store_segment;
    REAL4 store_plan_price;
    REAL8 store_latitude;
    REAL8 store_longitude;

		// EXPORT Stores:= DATASET('~DeliveryCenter::stores.csv',stores,CSV(heading(1)));
  END;
  EXPORT stores:= DATASET('~delivery_center::rgr::stores.csv',rec_stores,CSV(heading(1)));
  
  EXPORT rec_deliveries :=	RECORD
    UNSIGNED4 driver_id;
    UNSIGNED4 delivery_order_id;
    UNSIGNED3 delivery_id;
    UNSIGNED4 delivery_distance_meters;
    STRING10 delivery_status;

		// EXPORT Deliveries:= DATASET('~DeliveryCenter::deliveries.csv',deliveries,CSV(heading(1)));
  END;
  EXPORT deliveries:= DATASET('~delivery_center::rgr::deliveries.csv',rec_deliveries,CSV(heading(1)));
  
  EXPORT rec_drivers :=	RECORD
    UNSIGNED3 driver_id;
    STRING7 driver_modal;
    STRING17 driver_type;

		// EXPORT Drivers:= DATASET('~DeliveryCenter::drivers.csv',drivers,CSV(heading(1)));
  END;
  EXPORT drivers:= DATASET('~delivery_center::rgr::drivers.csv',rec_drivers,CSV(heading(1)));
  
  EXPORT rec_channels :=	RECORD
    UNSIGNED1 channel_id;
    STRING14 channel_name;
    STRING11 channel_type;

		// EXPORT Channels:= DATASET('~DeliveryCenter::channels.csv',channels,CSV(heading(1)));
  END;
  EXPORT channels:= DATASET('~delivery_center::rgr::channels.csv',rec_channels,CSV(heading(1)));
  
  EXPORT rec_orders :=	RECORD
    UNSIGNED4 payment_order_id;
    UNSIGNED2 delivery_order_id;
    UNSIGNED1 store_id;
    UNSIGNED4 channel_id;
    UNSIGNED4 order_id;
    STRING8 order_status;
    REAL8 order_amount;
    REAL4 order_delivery_fee;
    REAL4 order_delivery_cost;
    UNSIGNED1 order_created_hour;
    UNSIGNED1 order_created_minute;
    UNSIGNED1 order_created_day;
    UNSIGNED1 order_created_month;
    UNSIGNED2 order_created_year;
    STRING21 order_moment_created;
    STRING21 order_moment_accepted;
    STRING21 order_moment_ready;
    STRING21 order_moment_collected;
    STRING21 order_moment_in_expedition;
    STRING21 order_moment_delivering;
    STRING21 order_moment_delivered;
    STRING21 order_moment_finished;
    REAL4 order_metric_collected_time;
    REAL8 order_metric_paused_time;
    REAL8 order_metric_production_time;
    REAL4 order_metric_walking_time;
    REAL4 order_metric_expedition_speed_time;
    REAL8 order_metric_transit_time;
    REAL8 order_metric_cycle_time;
		// EXPORT Orders:= DATASET('~DeliveryCenter::orders.csv',orders,CSV(heading(1)));
  END;
  EXPORT orders:= DATASET('~delivery_center::rgr::orders.csv',rec_orders,CSV(heading(1)));
END;

