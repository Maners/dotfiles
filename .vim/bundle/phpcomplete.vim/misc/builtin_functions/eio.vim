call extend(g:php_builtin_functions, {
\ 'eio_busy(': 'int $delay [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_cancel(': 'resource $req | void',
\ 'eio_chmod(': 'string $path, int $mode [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_chown(': 'string $path, int $uid [, int $gid = -1 [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]]] | resource',
\ 'eio_close(': 'mixed $fd [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_custom(': 'callable $execute, int $pri, callable $callback [, mixed $data = NULL] | resource',
\ 'eio_dup2(': 'mixed $fd, mixed $fd2 [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_event_loop(': 'void | bool',
\ 'eio_fallocate(': 'mixed $fd, int $mode, int $offset, int $length [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_fchmod(': 'mixed $fd, int $mode [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_fchown(': 'mixed $fd, int $uid [, int $gid = -1 [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]]] | resource',
\ 'eio_fdatasync(': 'mixed $fd [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_fstat(': 'mixed $fd, int $pri, callable $callback [, mixed $data] | resource',
\ 'eio_fstatvfs(': 'mixed $fd, int $pri, callable $callback [, mixed $data] | resource',
\ 'eio_fsync(': 'mixed $fd [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_ftruncate(': 'mixed $fd [, int $offset = 0 [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]]] | resource',
\ 'eio_futime(': 'mixed $fd, float $atime, float $mtime [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_get_event_stream(': 'void | mixed',
\ 'eio_get_last_error(': 'resource $req | string',
\ 'eio_grp_add(': 'resource $grp, resource $req | void',
\ 'eio_grp_cancel(': 'resource $grp | void',
\ 'eio_grp_limit(': 'resource $grp, int $limit | void',
\ 'eio_grp(': 'callable $callback [, string $data = NULL] | resource',
\ 'eio_init(': 'void | void',
\ 'eio_link(': 'string $path, string $new_path [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_lstat(': 'string $path, int $pri, callable $callback [, mixed $data = NULL] | resource',
\ 'eio_mkdir(': 'string $path, int $mode [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_mknod(': 'string $path, int $mode, int $dev [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_nop(': '[ int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_npending(': 'void | int',
\ 'eio_nready(': 'void | int',
\ 'eio_nreqs(': 'void | int',
\ 'eio_nthreads(': 'void | int',
\ 'eio_open(': 'string $path, int $flags, int $mode, int $pri, callable $callback [, mixed $data = NULL] | resource',
\ 'eio_poll(': 'void | int',
\ 'eio_read(': 'mixed $fd, int $length, int $offset, int $pri, callable $callback [, mixed $data = NULL] | resource',
\ 'eio_readahead(': 'mixed $fd, int $offset, int $length [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_readdir(': 'string $path, int $flags, int $pri, callable $callback [, string $data = NULL] | resource',
\ 'eio_readlink(': 'string $path, int $pri, callable $callback [, string $data = NULL] | resource',
\ 'eio_realpath(': 'string $path, int $pri, callable $callback [, string $data = NULL] | resource',
\ 'eio_rename(': 'string $path, string $new_path [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_rmdir(': 'string $path [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_seek(': 'mixed $fd, int $offset, int $whence [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_sendfile(': 'mixed $out_fd, mixed $in_fd, int $offset, int $length [, int $pri [, callable $callback [, string $data]]] | resource',
\ 'eio_set_max_idle(': 'int $nthreads | void',
\ 'eio_set_max_parallel(': 'int $nthreads | void',
\ 'eio_set_max_poll_reqs(': 'int $nreqs | void',
\ 'eio_set_max_poll_time(': 'float $nseconds | void',
\ 'eio_set_min_parallel(': 'string $nthreads | void',
\ 'eio_stat(': 'string $path, int $pri, callable $callback [, mixed $data = NULL] | resource',
\ 'eio_statvfs(': 'string $path, int $pri, callable $callback [, mixed $data] | resource',
\ 'eio_symlink(': 'string $path, string $new_path [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_sync_file_range(': 'mixed $fd, int $offset, int $nbytes, int $flags [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_sync(': '[ int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_syncfs(': 'mixed $fd [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_truncate(': 'string $path [, int $offset = 0 [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]]] | resource',
\ 'eio_unlink(': 'string $path [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_utime(': 'string $path, float $atime, float $mtime [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]] | resource',
\ 'eio_write(': 'mixed $fd, string $str [, int $length = 0 [, int $offset = 0 [, int $pri = EIO_PRI_DEFAULT [, callable $callback = NULL [, mixed $data = NULL]]]]] | resource',
\ })
