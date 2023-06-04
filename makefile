ariadne_version=1.0.4
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
root_dir := $(dir $(mkfile_path))
scripts_dir=$(root_dir)scripts/
template_dir=$(root_dir)template/
section_dir=$(root_dir)cards/
new_cards=10
cards_to_remind=10

install:
	go install github.com/gottenheim/ariadne@v$(ariadne_version)

new-card:
	@ariadne card new --section-dir=$(section_dir) --template-dir=$(template_dir)

run:
	@cd $(section_dir)$(CARD) && ./question.sh

compress-answer:
	@ariadne card compress-answer --card-dir=$(section_dir)$(CARD)

show-answer:
	@ariadne card show-answer --card-dir=$(section_dir)$(CARD)

extract-answer:
	@ariadne card extract-answer --card-dir=$(section_dir)$(CARD)

study-cards:
	@ariadne study-cards --dir=$(root_dir) --new-cards=$(new_cards) --cards-to-remind=$(cards_to_remind)

clean:
	git clean -dfX