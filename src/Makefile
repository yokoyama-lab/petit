all:
	bnfc -ocaml Petit.cf
	ocamlyacc ParPetit.mly
	ocamllex LexPetit.mll
	ocamlc -o petit BNFC_Util.ml AbsPetit.ml ShowPetit.ml PrintPetit.ml EvalPetit.ml ParPetit.mli ParPetit.ml LexPetit.ml Main.ml

clean:
	-rm -f *.cmi *.cmo *.o

distclean: clean
	-rm -f LexPetit.* ParPetit.* PrintPetit.* ShowPetit.* AbsPetit.* petit BNFC_Util.ml

test:
	./petit ../example/addition.petit
	./petit ../example/multiplication.petit
