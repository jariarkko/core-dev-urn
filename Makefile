
all:
	scp ../../../../IETF/newdb/real/history-i-d/draft-arkko-core-dev-urn-05.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-00.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-01.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-02.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-03.txt \
	    jar@arkko.eu:/tmp
	scp draft-ietf-core-dev-urn.xml jar@arkko.eu:/tmp
	ssh jar@arkko.eu 'cd /tmp; xml2rfc draft-ietf-core-dev-urn.xml'
	scp jar@arkko.eu:/tmp/draft-ietf-core-dev-urn.txt .
	ssh jar@arkko.eu 'cd /tmp; rfcdiff draft-ietf-core-dev-urn-03.txt draft-ietf-core-dev-urn.txt'
	ssh jar@arkko.eu 'cd /tmp; rfcdiff draft-arkko-core-dev-urn-05.txt draft-ietf-core-dev-urn.txt'
	scp jar@arkko.eu:/tmp/draft-ietf-core-dev-urn-from-arkko-core-dev-urn-05.diff.html .
	scp jar@arkko.eu:/tmp/draft-ietf-core-dev-urn-from--03.diff.html .
	scp draft-ietf-core-dev-urn.xml \
	    draft-ietf-core-dev-urn.txt \
	    draft-ietf-core-dev-urn-from-arkko-core-dev-urn-05.diff.html \
	    draft-ietf-core-dev-urn-from--03.diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/core
