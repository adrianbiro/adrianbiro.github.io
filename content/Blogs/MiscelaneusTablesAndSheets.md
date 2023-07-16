# Miscelaneus Tables And Sheets
## Antenna Gain
```
-10 dBi
One tenth or 10 % (loss)
-6 dBi
One quarter or 25 % (loss)
-3 dBi
One half or 50% (loss)
0 dBi
Same or 100% (no gain/loss)
+1 dBi
12% higher or x 1.12
+2 dBi
58% higher or x 1.58
+3 dBi
100% higher or double
+6 dBi
4x higher or quadruple
+9 dBi
8x higher
+10 dBi
10x higher
+13 dBi
20x higher
+20 dBi
100x higher
```
[Gain in dBi Meaning](https://antennatestlab.com/antenna-education-tutorials/what-is-antenna-gain-dbi-scale)

[UniFi - Introduction to Antenna Radiation Patterns](https://help.ui.com/hc/en-us/articles/115012664088)

[UniFi Network - AP Antenna Radiation Patterns](https://help.ui.com/hc/en-us/articles/115005212927-UniFi-UAP-Antenna-Radiation-Patterns)

[Power level table dBm](https://en.wikipedia.org/wiki/DBm) 

[2.4/5ghz](https://www.data-alliance.net/blog/5ghz-wireless-frequency-properties-applications-comparison-to-24ghz-wifi/)

## HTTP Status Codes
* 1xx (Informational): The request was received, continuing process 
* 2xx (Successful): The request was successfully received, understood, and accepted 
* 3xx (Redirection): Further action needs to be taken in order to complete the request
* 4xx (Client Error): The request contains bad syntax or cannot be fulfilled
* 5xx (Server Error): The server failed to fulfill an apparently valid request

[RFC 9110 HTTP Semantics](https://www.rfc-editor.org/rfc/rfc9110.html#name-status-codes)

## Order Of Magnitude Units

Decimal 
------
$1000$ 	kB 	kilobyte 

$1000^2$ 	MB 	megabyte

$1000^3$ 	GB 	gigabyte

$1000^4$ 	TB 	terabyte

$1000^5$ 	PB 	petabyte

$1000^6$ 	EB 	exabyte

$1000^7$	ZB 	zettabyte

$1000^8$ 	YB 	yottabyte
	
Binary
---
$1024$ 	KiB 	kibibyte 	

$1024^2$ 	MiB 	mebibyte 	

$1024^3$ 	GiB 	gibibyte 	

$1024^4$ 	TiB 	tebibyte 	

$1024^5$ 	PiB 	pebibyte 	

$1024^6$ 	EiB 	exbibyte 	

$1024^7$ 	ZiB 	zebibyte 	

$1024^8$ 	YiB 	yobibyte 	

## Screen resolution
[link](https://gist.github.com/adrianbiro/9b9ea36bb78cbf5a961ea407c94114c5)
Source in [link](https://github.com/basujindal/basujindal.github.io/blob/master/_posts/2021-10-11-screen-resolution.md)

## System Exit Codes

`find /usr -name sysexits.h`

```c
/*
 *  SYSEXITS.H -- Exit status codes for system programs.
 *
 *	This include file attempts to categorize possible error
 *	exit statuses for system programs, notably delivermail
 *	and the Berkeley network.
 *
 *	Error numbers begin at EX__BASE to reduce the possibility of
 *	clashing with other exit statuses that random programs may
 *	already return.  The meaning of the codes is approximately
 *	as follows:
 *
 *	EX_USAGE -- The command was used incorrectly, e.g., with
 *		the wrong number of arguments, a bad flag, a bad
 *		syntax in a parameter, or whatever.
 *	EX_DATAERR -- The input data was incorrect in some way.
 *		This should only be used for user's data & not
 *		system files.
 *	EX_NOINPUT -- An input file (not a system file) did not
 *		exist or was not readable.  This could also include
 *		errors like "No message" to a mailer (if it cared
 *		to catch it).
 *	EX_NOUSER -- The user specified did not exist.  This might
 *		be used for mail addresses or remote logins.
 *	EX_NOHOST -- The host specified did not exist.  This is used
 *		in mail addresses or network requests.
 *	EX_UNAVAILABLE -- A service is unavailable.  This can occur
 *		if a support program or file does not exist.  This
 *		can also be used as a catchall message when something
 *		you wanted to do doesn't work, but you don't know
 *		why.
 *	EX_SOFTWARE -- An internal software error has been detected.
 *		This should be limited to non-operating system related
 *		errors as possible.
 *	EX_OSERR -- An operating system error has been detected.
 *		This is intended to be used for such things as "cannot
 *		fork", "cannot create pipe", or the like.  It includes
 *		things like getuid returning a user that does not
 *		exist in the passwd file.
 *	EX_OSFILE -- Some system file (e.g., /etc/passwd, /etc/utmp,
 *		etc.) does not exist, cannot be opened, or has some
 *		sort of error (e.g., syntax error).
 *	EX_CANTCREAT -- A (user specified) output file cannot be
 *		created.
 *	EX_IOERR -- An error occurred while doing I/O on some file.
 *	EX_TEMPFAIL -- temporary failure, indicating something that
 *		is not really an error.  In sendmail, this means
 *		that a mailer (e.g.) could not create a connection,
 *		and the request should be reattempted later.
 *	EX_PROTOCOL -- the remote system returned something that
 *		was "not possible" during a protocol exchange.
 *	EX_NOPERM -- You did not have sufficient permission to
 *		perform the operation.  This is not intended for
 *		file system problems, which should use NOINPUT or
 *		CANTCREAT, but rather for higher level permissions.
 */

#define EX_OK		0	/* successful termination */

#define EX__BASE	64	/* base value for error messages */

#define EX_USAGE	64	/* command line usage error */
#define EX_DATAERR	65	/* data format error */
#define EX_NOINPUT	66	/* cannot open input */
#define EX_NOUSER	67	/* addressee unknown */
#define EX_NOHOST	68	/* host name unknown */
#define EX_UNAVAILABLE	69	/* service unavailable */
#define EX_SOFTWARE	70	/* internal software error */
#define EX_OSERR	71	/* system error (e.g., can't fork) */
#define EX_OSFILE	72	/* critical OS file missing */
#define EX_CANTCREAT	73	/* can't create (user) output file */
#define EX_IOERR	74	/* input/output error */
#define EX_TEMPFAIL	75	/* temp failure; user is invited to retry */
#define EX_PROTOCOL	76	/* remote error in protocol */
#define EX_NOPERM	77	/* permission denied */
#define EX_CONFIG	78	/* configuration error */

#define EX__MAX	78	/* maximum listed value */

#endif /* sysexits.h */
```