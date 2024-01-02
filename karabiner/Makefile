help:
	@echo make wk

clean:
	rm -f ~/.config/karabiner/assets/complex_modifications/*.json

wk: clean
	cp wk.json ~/.config/karabiner/assets/complex_modifications/
	@make done

done:
	@echo
	ls -l ~/.config/karabiner/assets/complex_modifications/
	@echo
	@echo "Enable rules at Karabiner-Elements > Complex Modifications > Add predefined rule."
	@echo
