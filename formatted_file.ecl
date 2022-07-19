IMPORT $,STD;

dataframe := $.table_sp;

// New layout for formatted data
new_Layout := RECORD
	UNSIGNED row_id;
  
	UNSIGNED4 day_created;
	STRING6 time_created;
  
  UNSIGNED4 day_accepted;
	STRING6 time_accepted;
  
  UNSIGNED4 day_ready;
	STRING6 time_ready;
  
  UNSIGNED4 day_collected;
	STRING6 time_collected;
  
  UNSIGNED4 day_in_expedition;
	STRING6 time_in_expedition;
  
  UNSIGNED4 day_delivering;
	STRING6 time_delivering;
  
  UNSIGNED4 day_finished;
	STRING6 time_finished;
  
	dataframe.df_final_columns_rec AND NOT [order_created_hour, order_created_minute, order_created_day, order_created_month, order_created_year,
                                          order_moment_created, order_moment_accepted, order_moment_ready, order_moment_collected, order_moment_in_expedition,
                                          order_moment_delivering, order_moment_finished];
END;

// TRANSFORM structure and associated PROJECT function for cleansing the original dataset
New_Layout Reformatter(dataframe.df_final_columns_rec L, UNSIGNED cnt):=TRANSFORM
		SELF.row_id:=cnt;
    
		SELF.day_created:=STD.Date.FromStringToDate(L.order_moment_created[1..9],'%m/%d/%Y');
		SELF.time_created:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_created[-1]='M', IF(L.order_moment_created[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_created[11..12]='12',12,(UNSIGNED1)L.order_moment_created[11..12]+12),
																					                   IF(L.order_moment_created[11..12]='12',0,(UNSIGNED1)L.order_moment_created[11..12])), 
                                                             
                                                             IF(L.order_moment_created[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_created[10..11]='12',12,(UNSIGNED1)L.order_moment_created[10..11]+12),
																					                   IF(L.order_moment_created[10..11]='12',0,(UNSIGNED1)L.order_moment_created[10..11]))),
                                                           
																			IF(L.order_moment_created[21]='M',(UNSIGNED1)L.order_moment_created[14..15], (UNSIGNED1)L.order_moment_created[13..14]),
                                      
																			IF(L.order_moment_created[21]='M',(UNSIGNED1)L.order_moment_created[17..18], (UNSIGNED1)L.order_moment_created[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
                                      
                                      
		SELF.day_accepted:=STD.Date.FromStringToDate(L.order_moment_accepted[1..9],'%m/%d/%Y');
		SELF.time_accepted:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_accepted[-1]='M', IF(L.order_moment_accepted[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_accepted[11..12]='12',12,(UNSIGNED1)L.order_moment_accepted[11..12]+12),
																					                   IF(L.order_moment_accepted[11..12]='12',0,(UNSIGNED1)L.order_moment_accepted[11..12])), 
                                                             
                                                             IF(L.order_moment_accepted[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_accepted[10..11]='12',12,(UNSIGNED1)L.order_moment_accepted[10..11]+12),
																					                   IF(L.order_moment_accepted[10..11]='12',0,(UNSIGNED1)L.order_moment_accepted[10..11]))),
                                                           
																			IF(L.order_moment_accepted[21]='M',(UNSIGNED1)L.order_moment_accepted[14..15], (UNSIGNED1)L.order_moment_accepted[13..14]),
                                      
																			IF(L.order_moment_accepted[21]='M',(UNSIGNED1)L.order_moment_accepted[17..18], (UNSIGNED1)L.order_moment_accepted[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
                                      
                                      
                                      
		SELF.day_ready:=STD.Date.FromStringToDate(L.order_moment_ready[1..9],'%m/%d/%Y');
		SELF.time_ready:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_ready[-1]='M', IF(L.order_moment_ready[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_ready[11..12]='12',12,(UNSIGNED1)L.order_moment_ready[11..12]+12),
																					                   IF(L.order_moment_ready[11..12]='12',0,(UNSIGNED1)L.order_moment_ready[11..12])), 
                                                             
                                                             IF(L.order_moment_ready[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_ready[10..11]='12',12,(UNSIGNED1)L.order_moment_ready[10..11]+12),
																					                   IF(L.order_moment_ready[10..11]='12',0,(UNSIGNED1)L.order_moment_ready[10..11]))),
                                                           
																			IF(L.order_moment_ready[21]='M',(UNSIGNED1)L.order_moment_ready[14..15], (UNSIGNED1)L.order_moment_ready[13..14]),
                                      
																			IF(L.order_moment_ready[21]='M',(UNSIGNED1)L.order_moment_ready[17..18], (UNSIGNED1)L.order_moment_ready[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
		SELF.day_collected:=STD.Date.FromStringToDate(L.order_moment_collected[1..9],'%m/%d/%Y');
		SELF.time_collected:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_collected[-1]='M', IF(L.order_moment_collected[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_collected[11..12]='12',12,(UNSIGNED1)L.order_moment_collected[11..12]+12),
																					                   IF(L.order_moment_collected[11..12]='12',0,(UNSIGNED1)L.order_moment_collected[11..12])), 
                                                             
                                                             IF(L.order_moment_collected[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_collected[10..11]='12',12,(UNSIGNED1)L.order_moment_collected[10..11]+12),
																					                   IF(L.order_moment_collected[10..11]='12',0,(UNSIGNED1)L.order_moment_collected[10..11]))),
                                                           
																			IF(L.order_moment_collected[21]='M',(UNSIGNED1)L.order_moment_collected[14..15], (UNSIGNED1)L.order_moment_collected[13..14]),
                                      
																			IF(L.order_moment_collected[21]='M',(UNSIGNED1)L.order_moment_collected[17..18], (UNSIGNED1)L.order_moment_collected[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
		SELF.day_in_expedition:=STD.Date.FromStringToDate(L.order_moment_in_expedition[1..9],'%m/%d/%Y');
		SELF.time_in_expedition:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_in_expedition[21]='M', IF(L.order_moment_in_expedition[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_in_expedition[11..12]='12',12,(UNSIGNED1)L.order_moment_in_expedition[11..12]+12),
																					                   IF(L.order_moment_in_expedition[11..12]='12',0,(UNSIGNED1)L.order_moment_in_expedition[11..12])), 
                                                             
                                                             IF(L.order_moment_in_expedition[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_in_expedition[10..11]='12',12,(UNSIGNED1)L.order_moment_in_expedition[10..11]+12),
																					                   IF(L.order_moment_in_expedition[10..11]='12',0,(UNSIGNED1)L.order_moment_in_expedition[10..11]))),
                                                           
																			IF(L.order_moment_in_expedition[21]='M',(UNSIGNED1)L.order_moment_in_expedition[14..15], (UNSIGNED1)L.order_moment_in_expedition[13..14]),
                                      
																			IF(L.order_moment_in_expedition[21]='M',(UNSIGNED1)L.order_moment_in_expedition[17..18], (UNSIGNED1)L.order_moment_in_expedition[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
		SELF.day_delivering:=STD.Date.FromStringToDate(L.order_moment_delivering[1..9],'%m/%d/%Y');
		SELF.time_delivering:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_delivering[21]='M', IF(L.order_moment_delivering[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_delivering[11..12]='12',12,(UNSIGNED1)L.order_moment_delivering[11..12]+12),
																					                   IF(L.order_moment_delivering[11..12]='12',0,(UNSIGNED1)L.order_moment_delivering[11..12])), 
                                                             
                                                             IF(L.order_moment_delivering[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_delivering[10..11]='12',12,(UNSIGNED1)L.order_moment_delivering[10..11]+12),
																					                   IF(L.order_moment_delivering[10..11]='12',0,(UNSIGNED1)L.order_moment_delivering[10..11]))),
                                                           
																			IF(L.order_moment_delivering[21]='M',(UNSIGNED1)L.order_moment_delivering[14..15], (UNSIGNED1)L.order_moment_delivering[13..14]),
                                      
																			IF(L.order_moment_delivering[21]='M',(UNSIGNED1)L.order_moment_delivering[17..18], (UNSIGNED1)L.order_moment_delivering[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
		SELF.day_finished:=STD.Date.FromStringToDate(L.order_moment_finished[1..9],'%m/%d/%Y');
		SELF.time_finished:=INTFORMAT(STD.Date.TimeFromParts(IF(L.order_moment_finished[21]='M', IF(L.order_moment_finished[20..21]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_finished[11..12]='12',12,(UNSIGNED1)L.order_moment_finished[11..12]+12),
																					                   IF(L.order_moment_finished[11..12]='12',0,(UNSIGNED1)L.order_moment_finished[11..12])), 
                                                             
                                                             IF(L.order_moment_finished[19..20]='PM',
		// SELF.time:=STD.Date.TimeFromParts(IF(L.Date[21..22]='PM',
																			                       IF(L.order_moment_finished[10..11]='12',12,(UNSIGNED1)L.order_moment_finished[10..11]+12),
																					                   IF(L.order_moment_finished[10..11]='12',0,(UNSIGNED1)L.order_moment_finished[10..11]))),
                                                           
																			IF(L.order_moment_finished[21]='M',(UNSIGNED1)L.order_moment_finished[14..15], (UNSIGNED1)L.order_moment_finished[13..14]),
                                      
																			IF(L.order_moment_finished[21]='M',(UNSIGNED1)L.order_moment_finished[17..18], (UNSIGNED1)L.order_moment_finished[16..17])),6,1);
																			// (UNSIGNED1)L.Date[18..19]);
                                      
                                      
		SELF:=L;
END;

EXPORT Formatted_File := PROJECT(dataframe.df,Reformatter(LEFT,COUNTER)):PERSIST('~chicago::rgr::intro::Formatted_file');