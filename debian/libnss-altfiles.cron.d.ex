#
# Regular cron jobs for the libnss-altfiles package.
#
0 4	* * *	root	[ -x /usr/bin/libnss-altfiles_maintenance ] && /usr/bin/libnss-altfiles_maintenance
