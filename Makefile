.PHONY: clean
.PHONY: run
run:
	@ruby plot.rb
clean:
	@rm *.svg *.gp *.txt
