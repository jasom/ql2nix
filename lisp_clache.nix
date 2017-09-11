
{ buildLispPackage, stdenv, fetchurl, lisp-project_clache, 
   lisp_alexandria, lisp_babel, lisp_cl-annot, lisp_cl-fad, lisp_cl-store, lisp_cl-syntax, lisp_cl-syntax-annot, lisp_ironclad, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_cl-annot lisp_cl-fad lisp_cl-store lisp_cl-syntax lisp_cl-syntax-annot lisp_ironclad lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "clache";
      
      sourceProject = "${lisp-project_clache}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_cl-annot} ${lisp_cl-fad} ${lisp_cl-store} ${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_ironclad} ${lisp_trivial-garbage}";
      name = "lisp_clache-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
