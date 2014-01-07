call extend(g:php_builtin_functions, {
\ 'iis_add_server(': 'string $path, string $comment, string $server_ip, int $port, string $host_name, int $rights, int $start_server | int',
\ 'iis_get_dir_security(': 'int $server_instance, string $virtual_path | int',
\ 'iis_get_script_map(': 'int $server_instance, string $virtual_path, string $script_extension | string',
\ 'iis_get_server_by_comment(': 'string $comment | int',
\ 'iis_get_server_by_path(': 'string $path | int',
\ 'iis_get_server_rights(': 'int $server_instance, string $virtual_path | int',
\ 'iis_get_service_state(': 'string $service_id | int',
\ 'iis_remove_server(': 'int $server_instance | int',
\ 'iis_set_app_settings(': 'int $server_instance, string $virtual_path, string $application_scope | int',
\ 'iis_set_dir_security(': 'int $server_instance, string $virtual_path, int $directory_flags | int',
\ 'iis_set_script_map(': 'int $server_instance, string $virtual_path, string $script_extension, string $engine_path, int $allow_scripting | int',
\ 'iis_set_server_rights(': 'int $server_instance, string $virtual_path, int $directory_flags | int',
\ 'iis_start_server(': 'int $server_instance | int',
\ 'iis_start_service(': 'string $service_id | int',
\ 'iis_stop_server(': 'int $server_instance | int',
\ 'iis_stop_service(': 'string $service_id | int',
\ })
