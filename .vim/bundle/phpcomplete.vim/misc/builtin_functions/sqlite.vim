call extend(g:php_builtin_functions, {
\ 'sqlite_array_query(': 'resource $dbhandle, string $query [, int $result_type = SQLITE_BOTH [, bool $decode_binary = true]] | array',
\ 'sqlite_busy_timeout(': 'resource $dbhandle, int $milliseconds | void',
\ 'sqlite_changes(': 'resource $dbhandle | int',
\ 'sqlite_close(': 'resource $dbhandle | void',
\ 'sqlite_column(': 'resource $result, mixed $index_or_name [, bool $decode_binary = true] | mixed',
\ 'sqlite_create_aggregate(': 'resource $dbhandle, string $function_name, callable $step_func, callable $finalize_func [, int $num_args = -1] | void',
\ 'sqlite_create_function(': 'resource $dbhandle, string $function_name, callable $callback [, int $num_args = -1] | void',
\ 'sqlite_current(': 'resource $result [, int $result_type = SQLITE_BOTH [, bool $decode_binary = true]] | array',
\ 'sqlite_error_string(': 'int $error_code | string',
\ 'sqlite_escape_string(': 'string $item | string',
\ 'sqlite_exec(': 'resource $dbhandle, string $query [, string &$error_msg] | bool',
\ 'sqlite_factory(': 'string $filename [, int $mode = 0666 [, string &$error_message]] | SQLiteDatabase',
\ 'sqlite_fetch_all(': 'resource $result [, int $result_type = SQLITE_BOTH [, bool $decode_binary = true]] | array',
\ 'sqlite_fetch_array(': 'resource $result [, int $result_type = SQLITE_BOTH [, bool $decode_binary = true]] | array',
\ 'sqlite_fetch_column_types(': 'string $table_name, resource $dbhandle [, int $result_type = SQLITE_ASSOC] | array',
\ 'sqlite_fetch_object(': 'resource $result [, string $class_name [, array $ctor_params [, bool $decode_binary = true]]] | object',
\ 'sqlite_fetch_single(': 'resource $result [, bool $decode_binary = true] | string',
\ 'sqlite_fetch_string(': 'sqlite_fetch_string — Alias of sqlite_fetch_single()',
\ 'sqlite_field_name(': 'resource $result, int $field_index | string',
\ 'sqlite_has_more(': 'resource $result | bool',
\ 'sqlite_has_prev(': 'resource $result | bool',
\ 'SQLiteResult::key(': 'void | int',
\ 'sqlite_last_error(': 'resource $dbhandle | int',
\ 'sqlite_last_insert_rowid(': 'resource $dbhandle | int',
\ 'sqlite_libencoding(': 'void | string',
\ 'sqlite_libversion(': 'void | string',
\ 'sqlite_next(': 'resource $result | bool',
\ 'sqlite_num_fields(': 'resource $result | int',
\ 'sqlite_num_rows(': 'resource $result | int',
\ 'sqlite_open(': 'string $filename [, int $mode = 0666 [, string &$error_message]] | resource',
\ 'sqlite_popen(': 'string $filename [, int $mode = 0666 [, string &$error_message]] | resource',
\ 'sqlite_prev(': 'resource $result | bool',
\ 'sqlite_query(': 'resource $dbhandle, string $query [, int $result_type = SQLITE_BOTH [, string &$error_msg]] | resource',
\ 'sqlite_rewind(': 'resource $result | bool',
\ 'sqlite_seek(': 'resource $result, int $rownum | bool',
\ 'sqlite_single_query(': 'resource $db, string $query [, bool $first_row_only [, bool $decode_binary]] | array',
\ 'sqlite_udf_decode_binary(': 'string $data | string',
\ 'sqlite_udf_encode_binary(': 'string $data | string',
\ 'sqlite_unbuffered_query(': 'resource $dbhandle, string $query [, int $result_type = SQLITE_BOTH [, string &$error_msg]] | resource',
\ 'sqlite_valid(': 'resource $result | bool',
\ })
