IMPORT $,STD;

EXPORT theft_index := MODULE
  SHARED dataframe := $.theft_record;
  SHARED dados := $.theft_record.theft;

  // New layout for formatted data
  EXPORT new_Layout := RECORD
    dataframe.rec_theft AND NOT [robbery, vehicle_robbery, theft, vehicle_theft];
    REAL criminality_index;
  END;

  // TRANSFORM structure and associated PROJECT function for cleansing the original dataset
  new_Layout Reformatter(dataframe.rec_theft L, UNSIGNED cnt):=TRANSFORM
    SELF.criminality_index := (2*(L.vehicle_robbery+L.vehicle_theft)+L.robbery+L.theft-1286)/(9992-1286);
    SELF:=L;
  END;

  EXPORT theft_index_value := PROJECT(dataframe.theft,Reformatter(LEFT,COUNTER)):PERSIST('~delivery_center::rgr::theft_index');
END;