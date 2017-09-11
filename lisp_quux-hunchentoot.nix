
{ buildLispPackage, stdenv, fetchurl, lisp-project_quux-hunchentoot, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_hunchentoot, lisp_lil, lisp_lparallel, lisp_optima,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_hunchentoot lisp_lil lisp_lparallel lisp_optima  ];
      inherit stdenv;
      systemName = "quux-hunchentoot";
      
      sourceProject = "${lisp-project_quux-hunchentoot}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_hunchentoot} ${lisp_lil} ${lisp_lparallel} ${lisp_optima}";
      name = "lisp_quux-hunchentoot-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
