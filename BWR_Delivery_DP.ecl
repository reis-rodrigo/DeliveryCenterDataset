IMPORT $,STD;

orders := $.record_raw.orders;
channels := $.record_raw.channels;
drivers := $.record_raw.drivers;
deliveries := $.record_raw.deliveries;
payments := $.record_raw.payments;
hubs := $.record_raw.hubs;
stores := $.record_raw.stores;

// Data Patterns
// profileOrders := STD.DataPatterns.Profile(orders);
// profileChannels := STD.DataPatterns.Profile(channels);
// profileDrivers := STD.DataPatterns.Profile(drivers);
// profileDeliveries := STD.DataPatterns.Profile(deliveries);
// profilePayments := STD.DataPatterns.Profile(payments);
// profileHubs := STD.DataPatterns.Profile(hubs);
// profileStores := STD.DataPatterns.Profile(stores);

// OUTPUT(profileOrders, ALL, NAMED('profileOrders'));
// OUTPUT(profileChannels, ALL, NAMED('profileChannels'));
// OUTPUT(profileDrivers, ALL, NAMED('profileDrivers'));
// OUTPUT(profileDeliveries, ALL, NAMED('profileDeliveries'));
// OUTPUT(profilePayments, ALL, NAMED('profilePayments'));
// OUTPUT(profileHubs, ALL, NAMED('profileHubs'));
// OUTPUT(profileStores, ALL, NAMED('profileStores'));

// Best Record Structure
bestrecordOrders := STD.DataPatterns.BestRecordStructure(orders);
bestrecordChannels := STD.DataPatterns.BestRecordStructure(channels);
bestrecordDrivers := STD.DataPatterns.BestRecordStructure(drivers);
bestrecordDeliveries := STD.DataPatterns.BestRecordStructure(deliveries);
bestrecordPayments := STD.DataPatterns.BestRecordStructure(payments);
bestrecordHubs := STD.DataPatterns.BestRecordStructure(hubs);
bestrecordStores := STD.DataPatterns.BestRecordStructure(stores);

OUTPUT(bestrecordOrders, ALL, NAMED('bestrecordOrders'));
OUTPUT(bestrecordChannels, ALL, NAMED('bestrecordChannels'));
OUTPUT(bestrecordDrivers, ALL, NAMED('bestrecordDrivers'));
OUTPUT(bestrecordDeliveries, ALL, NAMED('bestrecordDeliveries'));
OUTPUT(bestrecordPayments, ALL, NAMED('bestrecordPayments'));
OUTPUT(bestrecordHubs, ALL, NAMED('bestrecordHubs'));
OUTPUT(bestrecordStores, ALL, NAMED('bestrecordStores'));
