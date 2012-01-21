# Mutt sender profile:  akiress1976@gmail.com

# Sending options
set from="akiress1976@gmail.com"
set realname="Ben Guitreau"
set use_from=yes
set sendmail="/usr/bin/msmtp -a gmail"

# Signature file
set signature="~/.mutt/signatures/akiress1976@gmail.com"


# Customized headers
unmy_hdr *                      # Remove all extra headers first
my_hdr From: Ben Guitreau <akiress1976@gmail.com>
my_hdr Reply-To: Ben Guitreau <akiress1976@gmail.com>

# Include the profile name in the status line
set status_format="-%r-Mutt: %f [Msgs:%?M?%M/?%m%?n? New:%n?%?o? Old:%o?%?d? Del:%d?%?F? Flag:%F?%?t? Tag:%t?%?p? Post:%p?%?b? Inc:%b?%?l? %l?]---(%s/%S)---akiress1976@gmail.com-%>-(%P)---"

set pgp_verify_sig=yes
set pgp_sign_as=1167FAC8
set pgp_use_gpg_agent=yes
#set pgp_autosign

# GnuPG commands
set pgp_decode_command="gpg --no-verbose --batch --output - %f"
set pgp_verify_command="gpg --no-verbose --batch --output - --verify %s %f"
set pgp_decrypt_command="gpg --no-verbose --batch --output - %f"
set pgp_sign_command="gpg --no-verbose --batch --output - --armor --detach-sign --textmode %?a?-u %a? %f"
set pgp_clearsign_command="gpg --no-verbose --batch --output - --armor --textmode --clearsign %?a?-u %a? %f"
set pgp_encrypt_only_command="/usr/bin/pgpewrap gpg -v --batch --output - --encrypt --textmode --armor --always-trust -- -r %r -- %f"
set pgp_encrypt_sign_command="/usr/bin/pgpewrap gpg -v --batch --output - --encrypt --sign %?a?-u %a? --armor --always-trust -- -r %r -- %f"
set pgp_import_command="gpg --no-verbose --import -v %f"
set pgp_export_command="gpg --no-verbose --export --armor %r"
set pgp_verify_key_command="gpg --no-verbose --batch --fingerprint --check-sigs %r"
set pgp_list_pubring_command="gpg --no-verbose --batch --with-colons --list-keys %r" 
set pgp_list_secring_command="gpg --no-verbose --batch --with-colons --list-secret-keys %r" 
set pgp_getkeys_command=""
