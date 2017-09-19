
{ buildLispPackage, stdenv, fetchurl, lisp-project_queen-lisp, 
   lisp_cl-ppcre-unicode, lisp_alexandria, lisp_anaphora, lisp_named-readtables,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre-unicode lisp_alexandria lisp_anaphora lisp_named-readtables  ];
      inherit stdenv;
      systemName = "queen";
      
      sourceProject = "${lisp-project_queen-lisp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre-unicode} ${lisp_alexandria} ${lisp_anaphora} ${lisp_named-readtables}";
      name = "lisp_queen-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
