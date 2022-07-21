IMPORT $;
EXPORT relevo_record := MODULE
  EXPORT rec_relevo :=	RECORD
    STRING15 hub_name;
    REAL declividade;
  END;
  EXPORT relevo:= DATASET('~delivery_center::rgr::declividade.csv',rec_relevo, CSV);
END;