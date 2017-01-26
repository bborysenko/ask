

```
ip-10-0-0-36:~ # bats ~/test.bats
 ✓ nginx 1.9 is installed
 ✓ haproxy 1.6 is installed
 ✓ curl to http://127.0.0.1/QWE should return upper
 ✓ curl to http://127.0.0.1/QWE/RTY should return upper
 ✓ curl to http://127.0.0.1/123 should return upper
 ✓ curl to http://127.0.0.1/123/456 should return upper
 ✓ curl to http://127.0.0.1/ should return 404
 ✓ curl to http://127.0.0.1/QWE/123 should return 404
```
