all:
	ocamlyacc ParPetit.mly
	ocamllex LexPetit.mll
	ocamlc -o TestPetit BNFC_Util.ml AbsPetit.ml ShowPetit.ml PrintPetit.ml SkelPetit.ml ParPetit.mli ParPetit.ml LexPetit.ml TestPetit.ml

clean:
	-rm -f *.cmi *.cmo *.o

distclean: clean
	-rm -f LexPetit.* ParPetit.* LayoutPetit.* SkelPetit.* PrintPetit.* ShowPetit.* TestPetit.* AbsPetit.* TestPetit BNFC_Util.ml Makefile*

