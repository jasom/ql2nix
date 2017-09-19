
{ buildLispPackage, stdenv, fetchurl, lisp-project_access, 
   lisp_cl-interpol, lisp_anaphora, lisp_alexandria, lisp_closer-mop, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-interpol lisp_anaphora lisp_alexandria lisp_closer-mop lisp_iterate  ];
      inherit stdenv;
      systemName = "access";
      
      sourceProject = "${lisp-project_access}";
      patches = [];
      lisp_dependencies = "${lisp_cl-interpol} ${lisp_anaphora} ${lisp_alexandria} ${lisp_closer-mop} ${lisp_iterate}";
      name = "lisp_access-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
