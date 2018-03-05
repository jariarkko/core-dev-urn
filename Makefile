
all:
	scp ../../../../IETF/newdb/real/i-d/draft-arkko-core-dev-urn-05.txt \
	    jar@server1.arkko.eu:/tmp
	scp draft-ietf-core-dev-urn.xml jar@server1.arkko.eu:/tmp
	ssh jar@server1.arkko.eu 'cd /tmp; xml2rfc draft-ietf-core-dev-urn.xml'
	scp jar@server1.arkko.eu:/tmp/draft-ietf-core-dev-urn.txt .
	ssh jar@server1.arkko.eu 'cd /tmp; rfcdiff draft-arkko-core-dev-urn-05.txt draft-ietf-core-dev-urn.txt'
	scp jar@server1.arkko.eu:/tmp/draft-ietf-core-dev-urn-from-arkko-core-dev-urn-05.diff.html .
	scp draft-ietf-core-dev-urn.xml \
	    draft-ietf-core-dev-urn.txt \
	    draft-ietf-core-dev-urn-from-arkko-core-dev-urn-05.diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/core
