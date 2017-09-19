
{ buildLispPackage, stdenv, fetchurl, lisp-project_clache, 
   lisp_cl-syntax-annot, lisp_cl-syntax, lisp_cl-annot, lisp_cl-store, lisp_cl-fad, lisp_ironclad, lisp_babel, lisp_trivial-garbage, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-syntax-annot lisp_cl-syntax lisp_cl-annot lisp_cl-store lisp_cl-fad lisp_ironclad lisp_babel lisp_trivial-garbage lisp_alexandria  ];
      inherit stdenv;
      systemName = "clache";
      
      sourceProject = "${lisp-project_clache}";
      patches = [];
      lisp_dependencies = "${lisp_cl-syntax-annot} ${lisp_cl-syntax} ${lisp_cl-annot} ${lisp_cl-store} ${lisp_cl-fad} ${lisp_ironclad} ${lisp_babel} ${lisp_trivial-garbage} ${lisp_alexandria}";
      name = "lisp_clache-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
