
{ buildLispPackage, stdenv, fetchurl, lisp-project_recursive-regex, 
   lisp_symbol-munger, lisp_alexandria, lisp_cl-interpol, lisp_anaphora, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_symbol-munger lisp_alexandria lisp_cl-interpol lisp_anaphora lisp_iterate  ];
      inherit stdenv;
      systemName = "recursive-regex";
      
      sourceProject = "${lisp-project_recursive-regex}";
      patches = [];
      lisp_dependencies = "${lisp_symbol-munger} ${lisp_alexandria} ${lisp_cl-interpol} ${lisp_anaphora} ${lisp_iterate}";
      name = "lisp_recursive-regex-20120407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
