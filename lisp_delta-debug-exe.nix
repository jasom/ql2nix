
{ buildLispPackage, stdenv, fetchurl, lisp-project_delta-debug, 
   lisp_alexandria, lisp_curry-compose-reader-macros, lisp_delta-debug, lisp_diff, lisp_metabang-bind, lisp_split-sequence, lisp_trivial-shell,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_curry-compose-reader-macros lisp_delta-debug lisp_diff lisp_metabang-bind lisp_split-sequence lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "delta-debug-exe";
      
      sourceProject = "${lisp-project_delta-debug}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_curry-compose-reader-macros} ${lisp_delta-debug} ${lisp_diff} ${lisp_metabang-bind} ${lisp_split-sequence} ${lisp_trivial-shell}";
      name = "lisp_delta-debug-exe-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
