.PHONY: run clean

Complex\ Consent.inform/Source/story.ni: src/main.ni $(wildcard src/*.ni) $(wildcard src/**/*.ni)
	cpp -Wno-everything src/main.ni 1>/dev/null && \
cpp -Wno-everything src/main.ni \
| perl -pe's@ \| @	@g' \
| perl -pe's@^\|(.*)\|$$@\1@g' \
| perl -ne'print unless /^\#/' > Complex\ Consent.inform/Source/story.ni \
&& (reinform-build Complex\ Consent.inform/ || touch -t '197001010000' Complex\ Consent.inform/Source/story.ni)

clean:
	rm -f Complex\ Consent.inform/Source/story.ni

run: Complex\ Consent.inform/Source/story.ni
	reinform-run Complex\ Consent.inform/
