IMPORT $;
EXPORT theft_record := MODULE
  EXPORT rec_theft :=	RECORD
    STRING15 hub_name;
    UNSIGNED2 robbery;
    UNSIGNED2 vehicle_robbery;
    UNSIGNED2 theft;
    UNSIGNED2 vehicle_theft;
  END;
  EXPORT theft:= DATASET('~delivery_center::rgr::theft.csv',rec_theft,CSV(heading(1)));
END;