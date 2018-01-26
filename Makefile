.PHONY: run clean
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

Complex\ Consent.inform/Source/story.ni: src/main.ni $(call rwildcard,src,*.ni)
	cpp -Wno-everything src/main.ni 1>/dev/null && \
cpp -Wno-everything src/main.ni \
| perl -l -pe'while ($$_ =~ m@^(	)*  @) { $$_ =~ s@^(	)*  @\1\t@g }' \
| perl -pe's@ \| @	@g' \
| perl -pe's@^\|(.*)\|$$@\1@g' \
| perl -ne'print unless /^\#/' > Complex\ Consent.inform/Source/story.ni \
&& (reinform-build Complex\ Consent.inform/ || touch -t '197001010000' Complex\ Consent.inform/Source/story.ni)

clean:
	rm -f Complex\ Consent.inform/Source/story.ni

run: Complex\ Consent.inform/Source/story.ni
	reinform-run Complex\ Consent.inform/
