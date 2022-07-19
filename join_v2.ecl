import $;

rec_hubs := $.record_optimized.rec_hubs;
rec_payments := $.record_optimized.rec_payments;
rec_stores := $.record_optimized.rec_stores;
rec_deliveries := $.record_optimized.rec_deliveries;
rec_drivers := $.record_optimized.rec_drivers;
rec_channels := $.record_optimized.rec_channels;
rec_orders := $.record_optimized.rec_orders;

hubs := DATASET('~delivery_center::rgr::hubs.csv', rec_hubs, CSV(heading(1)));
payments := DATASET('~delivery_center::rgr::payments.csv', rec_payments, CSV(heading(1)));
stores := DATASET('~delivery_center::rgr::stores.csv', rec_stores, CSV(heading(1)));
deliveries := DATASET('~delivery_center::rgr::deliveries.csv', rec_deliveries, CSV(heading(1)));
drivers := DATASET('~delivery_center::rgr::drivers.csv', rec_drivers, CSV(heading(1)));
channels := DATASET('~delivery_center::rgr::channels.csv', rec_channels, CSV(heading(1)));
orders := DATASET('~delivery_center::rgr::orders.csv', rec_orders, CSV(heading(1)));


dataframe := JOIN([hubs, payments, stores, deliveries, drivers, channels, orders]);
