
{ buildLispPackage, stdenv, fetchurl, lisp-project_quux-hunchentoot, 
   lisp_optima, lisp_lparallel, lisp_lil, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_lparallel lisp_lil lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "quux-hunchentoot";
      
      sourceProject = "${lisp-project_quux-hunchentoot}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_lparallel} ${lisp_lil} ${lisp_hunchentoot}";
      name = "lisp_quux-hunchentoot-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
