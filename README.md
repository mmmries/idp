# IDP

This is a tiny project that aims to be an easy way to test SAML service providers.

For easiest testing please configure your service provider to use the `my_certificate.cer` file as the certificate.

__If you want to use a SHA256 fingerprint__
Enter `22:93:3C:28:17:95:EC:DA:39:37:22:1E:E9:12:8C:B1:6C:13:D8:B8:9C:8F:1E:5D:DC:FE:EA:29:F9:85:A4:F8` as the fingerprint.
If you need to specify the hashing algorithm use `http://www.w3.org/2001/04/xmldsig-more#rsa-sha256`.

Now you can hit the homepage of this project and enter:

* the service provider endpoint you want to forward to
* the nameID you want to send
* the relayState you want to send (optional)

When you hit enter you browser will be forwarded to the service provider with an encrypted saml response so you can test your app's behavior.
🤗😎🤓
