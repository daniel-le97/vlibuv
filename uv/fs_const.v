module uv

/*
 * This flag can be used with uv.fs_copyfile() to return an error if the
 * destination already exists.
 */
pub const uv_fs_copyfile_excl = 0x0001

/*
 * This flag can be used with uv.fs_copyfile() to attempt to create a reflink.
 * If copy-on-write is not supported, a fallback copy mechanism is used.
 */
pub const uv_fs_copyfile_ficlone = 0x0002

/*
 * This flag can be used with uv.fs_copyfile() to attempt to create a reflink.
 * If copy-on-write is not supported, an error is returned.
 */
pub const uv_fs_copyfile_ficlone_force = 0x0004

/*
 * This flag can be used with uv.fs_symlink() on Windows to specify whether
 * path argument points to a directory.
 */
pub const uv_fs_symlink_dir = 0x0001

/*
 * This flag can be used with uv.fs_symlink() on Windows to specify whether
 * the symlink is to be created using junction points.
 */
pub const uv_fs_symlink_junction = 0x0002
