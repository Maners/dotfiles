call extend(g:php_builtin_functions, {
\ 'cubrid_affected_rows(': '[ resource $conn_identifier] | int',
\ 'cubrid_bind(': 'resource $req_identifier, int $bind_index, mixed $bind_value [, string $bind_value_type] | bool',
\ 'cubrid_client_encoding(': '[ resource $conn_identifier] | string',
\ 'cubrid_close_prepare(': 'resource $req_identifier | bool',
\ 'cubrid_close_request(': 'resource $req_identifier | bool',
\ 'cubrid_close(': '[ resource $conn_identifier] | bool',
\ 'cubrid_col_get(': 'resource $conn_identifier, string $oid, string $attr_name | array',
\ 'cubrid_col_size(': 'resource $conn_identifier, string $oid, string $attr_name | int',
\ 'cubrid_column_names(': 'resource $req_identifier | array',
\ 'cubrid_column_types(': 'resource $req_identifier | array',
\ 'cubrid_commit(': 'resource $conn_identifier | bool',
\ 'cubrid_connect_with_url(': 'string $conn_url [, string $userid [, string $passwd [, bool $new_link = false]]] | resource',
\ 'cubrid_connect(': 'string $host, int $port, string $dbname [, string $userid [, string $passwd [, bool $new_link = false]]] | resource',
\ 'cubrid_current_oid(': 'resource $req_identifier | string',
\ 'cubrid_data_seek(': 'resource $result, int $row_number | bool',
\ 'cubrid_db_name(': 'array $result, int $index | string',
\ 'cubrid_disconnect(': '[ resource $conn_identifier] | bool',
\ 'cubrid_drop(': 'resource $conn_identifier, string $oid | bool',
\ 'cubrid_errno(': '[ resource $conn_identifier] | int',
\ 'cubrid_error_code_facility(': 'void | int',
\ 'cubrid_error_code(': 'void | int',
\ 'cubrid_error_msg(': 'void | string',
\ 'cubrid_error(': '[ resource $connection] | string',
\ 'cubrid_execute(': 'resource $conn_identifier, string $sql [, int $option] | resource',
\ 'cubrid_fetch_array(': 'resource $result [, int $type = CUBRID_BOTH] | array',
\ 'cubrid_fetch_assoc(': 'resource $result [, int $type] | array',
\ 'cubrid_fetch_field(': 'resource $result [, int $field_offset = 0] | object',
\ 'cubrid_fetch_lengths(': 'resource $result | array',
\ 'cubrid_fetch_object(': 'resource $result [, string $class_name [, array $params [, int $type]]] | object',
\ 'cubrid_fetch_row(': 'resource $result [, int $type] | array',
\ 'cubrid_fetch(': 'resource $result [, int $type = CUBRID_BOTH] | mixed',
\ 'cubrid_field_flags(': 'resource $result, int $field_offset | string',
\ 'cubrid_field_len(': 'resource $result, int $field_offset | int',
\ 'cubrid_field_name(': 'resource $result, int $field_offset | string',
\ 'cubrid_field_seek(': 'resource $result [, int $field_offset = 0] | bool',
\ 'cubrid_field_table(': 'resource $result, int $field_offset | string',
\ 'cubrid_field_type(': 'resource $result, int $field_offset | string',
\ 'cubrid_free_result(': 'resource $req_identifier | bool',
\ 'cubrid_get_autocommit(': 'resource $conn_identifier | bool',
\ 'cubrid_get_charset(': 'resource $conn_identifier | string',
\ 'cubrid_get_class_name(': 'resource $conn_identifier, string $oid | string',
\ 'cubrid_get_client_info(': 'void | string',
\ 'cubrid_get_db_parameter(': 'resource $conn_identifier | array',
\ 'cubrid_get_query_timeout(': 'resource $req_identifier | int',
\ 'cubrid_get_server_info(': 'resource $conn_identifier | string',
\ 'cubrid_get(': 'resource $conn_identifier, string $oid [, mixed $attr] | mixed',
\ 'cubrid_insert_id(': '[ resource $conn_identifier] | string',
\ 'cubrid_is_instance(': 'resource $conn_identifier, string $oid | int',
\ 'cubrid_list_dbs(': '[ resource $conn_identifier] | array',
\ 'cubrid_load_from_glo(': 'resource $conn_identifier, string $oid, string $file_name | int',
\ 'cubrid_lob_close(': 'array $lob_identifier_array | bool',
\ 'cubrid_lob_export(': 'resource $conn_identifier, resource $lob_identifier, string $path_name | bool',
\ 'cubrid_lob_get(': 'resource $conn_identifier, string $sql | array',
\ 'cubrid_lob_send(': 'resource $conn_identifier, resource $lob_identifier | bool',
\ 'cubrid_lob_size(': 'resource $lob_identifier | string',
\ 'cubrid_lob2_bind(': 'resource $req_identifier, int $bind_index, mixed $bind_value [, string $bind_value_type] | bool',
\ 'cubrid_lob2_close(': 'resource $lob_identifier | bool',
\ 'cubrid_lob2_export(': 'resource $lob_identifier, string $file_name | bool',
\ 'cubrid_lob2_import(': 'resource $lob_identifier, string $file_name | bool',
\ 'cubrid_lob2_new(': '[ resource $conn_identifier [, string $type = "BLOB"]] | resource',
\ 'cubrid_lob2_read(': 'resource $lob_identifier, int $len | string',
\ 'cubrid_lob2_seek(': 'resource $lob_identifier, int $offset [, int $origin = CUBRID_CURSOR_CURRENT] | bool',
\ 'cubrid_lob2_seek64(': 'resource $lob_identifier, string $offset [, int $origin = CUBRID_CURSOR_CURRENT] | bool',
\ 'cubrid_lob2_size(': 'resource $lob_identifier | int',
\ 'cubrid_lob2_size64(': 'resource $lob_identifier | string',
\ 'cubrid_lob2_tell(': 'resource $lob_identifier | int',
\ 'cubrid_lob2_tell64(': 'resource $lob_identifier | string',
\ 'cubrid_lob2_write(': 'resource $lob_identifier, string $buf | bool',
\ 'cubrid_lock_read(': 'resource $conn_identifier, string $oid | bool',
\ 'cubrid_lock_write(': 'resource $conn_identifier, string $oid | bool',
\ 'cubrid_move_cursor(': 'resource $req_identifier, int $offset [, int $origin = CUBRID_CURSOR_CURRENT] | int',
\ 'cubrid_new_glo(': 'resource $conn_identifier, string $class_name, string $file_name | string',
\ 'cubrid_next_result(': 'resource $result | bool',
\ 'cubrid_num_cols(': 'resource $result | int',
\ 'cubrid_num_fields(': 'resource $result | int',
\ 'cubrid_num_rows(': 'resource $result | int',
\ 'cubrid_pconnect_with_url(': 'string $conn_url [, string $userid [, string $passwd]] | resource',
\ 'cubrid_pconnect(': 'string $host, int $port, string $dbname [, string $userid [, string $passwd]] | resource',
\ 'cubrid_ping(': '[ resource $conn_identifier] | bool',
\ 'cubrid_prepare(': 'resource $conn_identifier, string $prepare_stmt [, int $option = 0] | resource',
\ 'cubrid_put(': 'resource $conn_identifier, string $oid [, string $attr [, mixed $value]] | int',
\ 'cubrid_query(': 'string $query [, resource $conn_identifier] | resource',
\ 'cubrid_real_escape_string(': 'string $unescaped_string [, resource $conn_identifier] | string',
\ 'cubrid_result(': 'resource $result, int $row [, mixed $field = 0] | string',
\ 'cubrid_rollback(': 'resource $conn_identifier | bool',
\ 'cubrid_save_to_glo(': 'resource $conn_identifier, string $oid, string $file_name | int',
\ 'cubrid_schema(': 'resource $conn_identifier, int $schema_type [, string $class_name [, string $attr_name]] | array',
\ 'cubrid_send_glo(': 'resource $conn_identifier, string $oid | int',
\ 'cubrid_seq_drop(': 'resource $conn_identifier, string $oid, string $attr_name, int $index | bool',
\ 'cubrid_seq_insert(': 'resource $conn_identifier, string $oid, string $attr_name, int $index, string $seq_element | bool',
\ 'cubrid_seq_put(': 'resource $conn_identifier, string $oid, string $attr_name, int $index, string $seq_element | bool',
\ 'cubrid_set_add(': 'resource $conn_identifier, string $oid, string $attr_name, string $set_element | bool',
\ 'cubrid_set_autocommit(': 'resource $conn_identifier, bool $mode | bool',
\ 'cubrid_set_db_parameter(': 'resource $conn_identifier, int $param_type, int $param_value | bool',
\ 'cubrid_set_drop(': 'resource $conn_identifier, string $oid, string $attr_name, string $set_element | bool',
\ 'cubrid_set_query_timeout(': 'resource $req_identifier, int $timeout | bool',
\ 'cubrid_unbuffered_query(': 'string $query [, resource $conn_identifier] | resource',
\ 'cubrid_version(': 'void | string',
\ })
