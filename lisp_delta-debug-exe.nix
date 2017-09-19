
{ buildLispPackage, stdenv, fetchurl, lisp-project_delta-debug, 
   lisp_split-sequence, lisp_trivial-shell, lisp_diff, lisp_curry-compose-reader-macros, lisp_metabang-bind, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_trivial-shell lisp_diff lisp_curry-compose-reader-macros lisp_metabang-bind lisp_alexandria  ];
      inherit stdenv;
      systemName = "delta-debug-exe";
      
      sourceProject = "${lisp-project_delta-debug}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_trivial-shell} ${lisp_diff} ${lisp_curry-compose-reader-macros} ${lisp_metabang-bind} ${lisp_alexandria}";
      name = "lisp_delta-debug-exe-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
