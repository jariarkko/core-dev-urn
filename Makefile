CUSER=jar
CMACH=router1.arkko.eu
WUSER=root
WMACH=cloud3.arkko.eu

all:
	scp ../../../../IETF/newdb/real/history-i-d/draft-arkko-core-dev-urn-05.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-00.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-01.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-02.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-03.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-04.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-05.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-06.txt \
	    ../../../../IETF/newdb/real/history-i-d/draft-ietf-core-dev-urn-07.txt \
	    $(CUSER)@$(CMACH):/tmp
	scp draft-ietf-core-dev-urn.xml $(CUSER)@$(CMACH):/tmp
	ssh $(CUSER)@$(CMACH) 'cd /tmp; xml2rfc draft-ietf-core-dev-urn.xml'
	scp $(CUSER)@$(CMACH):/tmp/draft-ietf-core-dev-urn.txt .
	ssh $(CUSER)@$(CMACH) 'cd /tmp; rfcdiff draft-ietf-core-dev-urn-07.txt draft-ietf-core-dev-urn.txt'
	ssh $(CUSER)@$(CMACH) 'cd /tmp; rfcdiff draft-arkko-core-dev-urn-05.txt draft-ietf-core-dev-urn.txt'
	scp $(CUSER)@$(CMACH):/tmp/draft-ietf-core-dev-urn-from-arkko-core-dev-urn-05.diff.html .
	scp $(CUSER)@$(CMACH):/tmp/draft-ietf-core-dev-urn-from--07.diff.html .
	scp draft-ietf-core-dev-urn.xml \
	    draft-ietf-core-dev-urn.txt \
	    draft-ietf-core-dev-urn-from-arkko-core-dev-urn-05.diff.html \
	    draft-ietf-core-dev-urn-from--07.diff.html \
	    $(WUSER)@$(WMACH):/var/www/www.arkko.com/html/ietf/core
