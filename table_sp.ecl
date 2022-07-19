IMPORT $;

EXPORT table_sp := MODULE
  SHARED rec_joineds := $.join_ds.joineds;
  SHARED sp := $.Filter_SP.sp_data;

  EXPORT df_final_columns_rec := RECORD
    rec_joineds.order_id;
    rec_joineds.store_id;
    rec_joineds.order_status;
    rec_joineds.order_amount;
    rec_joineds.order_delivery_cost;
    rec_joineds.order_created_hour;
    rec_joineds.order_created_minute;
    rec_joineds.order_created_day;
    rec_joineds.order_created_month;
    rec_joineds.order_created_year;
    rec_joineds.order_moment_created;
    rec_joineds.order_moment_accepted;
    rec_joineds.order_moment_ready;
    rec_joineds.order_moment_collected;
    rec_joineds.order_moment_in_expedition;
    rec_joineds.order_moment_delivering;
    rec_joineds.order_moment_finished;
    rec_joineds.order_metric_collected_time;
    rec_joineds.order_metric_paused_time;
    rec_joineds.order_metric_production_time;
    rec_joineds.order_metric_walking_time;
    rec_joineds.order_metric_expedition_speed_time;
    rec_joineds.order_metric_transit_time;
    rec_joineds.order_metric_cycle_time;
    rec_joineds.hub_id;
    rec_joineds.store_latitude;
    rec_joineds.store_longitude;
    rec_joineds.hub_name;
    rec_joineds.hub_city;
    rec_joineds.hub_state;
    rec_joineds.hub_latitude;
    rec_joineds.hub_longitude;
    rec_joineds.payment_amount;
    rec_joineds.payment_fee;
    rec_joineds.driver_id;
    rec_joineds.delivery_distance_meters;
    rec_joineds.driver_modal;
    rec_joineds.driver_type;
    rec_joineds.channel_type;
  END;

  EXPORT df := TABLE(sp, df_final_columns_rec);
END;

// IMPORT $;

// rec_joineds := $.join_ds.joineds;
// sp := $.Filter_SP.sp_data;

// df_final_columns_rec := RECORD
  // rec_joineds.order_id;
  // rec_joineds.store_id;
  // rec_joineds.order_status;
  // rec_joineds.order_amount;
  // rec_joineds.order_delivery_cost;
  // rec_joineds.order_created_hour;
  // rec_joineds.order_created_minute;
  // rec_joineds.order_created_day;
  // rec_joineds.order_created_month;
  // rec_joineds.order_created_year;
  // rec_joineds.order_moment_created;
  // rec_joineds.order_moment_accepted;
  // rec_joineds.order_moment_ready;
  // rec_joineds.order_moment_collected;
  // rec_joineds.order_moment_in_expedition;
  // rec_joineds.order_moment_delivering;
  // rec_joineds.order_moment_finished;
  // rec_joineds.order_metric_collected_time;
  // rec_joineds.order_metric_paused_time;
  // rec_joineds.order_metric_production_time;
  // rec_joineds.order_metric_walking_time;
  // rec_joineds.order_metric_expedition_speed_time;
  // rec_joineds.order_metric_transit_time;
  // rec_joineds.order_metric_cycle_time;
  // rec_joineds.hub_id;
  // rec_joineds.store_latitude;
  // rec_joineds.store_longitude;
  // rec_joineds.hub_name;
  // rec_joineds.hub_city;
  // rec_joineds.hub_state;
  // rec_joineds.hub_latitude;
  // rec_joineds.hub_longitude;
  // rec_joineds.payment_amount;
  // rec_joineds.payment_fee;
  // rec_joineds.driver_id;
  // rec_joineds.delivery_distance_meters;
  // rec_joineds.driver_modal;
  // rec_joineds.driver_type;
  // rec_joineds.channel_type;
// END;

// EXPORT table_sp := TABLE(sp, df_final_columns_rec);

// OUTPUT(TABLE(sp, df_final_columns_rec));