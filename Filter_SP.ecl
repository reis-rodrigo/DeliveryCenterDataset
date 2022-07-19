IMPORT $;

File := $.join_ds.joineds;

// IsSP := File.hub_state = 'SP';

// recset := File(IsSP);

// OUTPUT(recset);

sp_data := File(hub_state = 'SP');
COUNT(File(hub_state = 'SP'));

OUTPUT(sp_data,, '~delivery_center::rgr::sp_data',overwrite);