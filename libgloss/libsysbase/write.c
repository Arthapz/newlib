#include "config.h"
#include <_ansi.h>
#include <_syslist.h>
#include <stdio.h>
#include <errno.h>

#include <sys/iosupport.h>

//---------------------------------------------------------------------------------
_ssize_t _write_r(struct _reent * r, int fileDesc, const void *ptr, size_t len) {
//---------------------------------------------------------------------------------
	int ret = -1;
	unsigned int dev = 0;

	__handle * handle = NULL;

	if(fileDesc!=-1) {
		handle = __get_handle(fileDesc);

		if ( NULL == handle ) return ret;

		dev = handle->device;

		if(devoptab_list[dev]->write_r) {
			r->deviceData = devoptab_list[dev]->deviceData;
			ret = devoptab_list[dev]->write_r(r,handle->fileStruct,ptr,len);
		} else
			r->_errno=ENOSYS;
	}
	return ret;
}