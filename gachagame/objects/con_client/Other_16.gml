/// @description update collection

buffer_seek(client_buffer, buffer_seek_start, 0);
buffer_write(client_buffer, buffer_u8, network.player_collection);
buffer_write(client_buffer, buffer_text, user);
network_send_packet(client, client_buffer, buffer_tell(client_buffer));