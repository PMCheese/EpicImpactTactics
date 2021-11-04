/// @description subtract 1 from currency

premium_currency--;

buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.gacha_pull);
buffer_write(client_buffer, buffer_text, user);
network_send_packet(client, client_buffer, buffer_tell(client_buffer));