
{ buildLispPackage, stdenv, fetchurl, lisp-project_planks, 
   lisp_closer-mop, lisp_babel, lisp_trivial-garbage, lisp_bordeaux-threads, lisp_ironclad, lisp_rucksack,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_babel lisp_trivial-garbage lisp_bordeaux-threads lisp_ironclad lisp_rucksack  ];
      inherit stdenv;
      systemName = "planks";
      
      sourceProject = "${lisp-project_planks}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_babel} ${lisp_trivial-garbage} ${lisp_bordeaux-threads} ${lisp_ironclad} ${lisp_rucksack}";
      name = "lisp_planks-20110522-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
