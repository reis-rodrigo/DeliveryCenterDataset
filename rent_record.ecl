IMPORT $,STD;

EXPORT rent_record := MODULE
  SHARED dataframe := $.table_sp;

  // New layout for formatted data
  EXPORT new_Layout := RECORD
    dataframe.df_final_columns_rec;
    REAL rentability;
  END;

  // TRANSFORM structure and associated PROJECT function for cleansing the original dataset
  New_Layout Reformatter(dataframe.df_final_columns_rec L):=TRANSFORM
      SELF.rentability:=IF(L.driver_modal = 'MOTOBOY', L.order_delivery_cost - L.delivery_distance_meters*0.001*3.475/35, L.order_delivery_cost);               
      SELF:=L;
  END;

  EXPORT rentability := PROJECT(dataframe.df,Reformatter(LEFT)):PERSIST('~delivery_center::rgr::rentability');
  
END;