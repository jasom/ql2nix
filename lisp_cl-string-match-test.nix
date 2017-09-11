
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-string-match, 
   lisp_ascii-strings, lisp_cl-string-match, lisp_lisp-unit, lisp_simple-scanf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ascii-strings lisp_cl-string-match lisp_lisp-unit lisp_simple-scanf  ];
      inherit stdenv;
      systemName = "cl-string-match-test";
      
      sourceProject = "${lisp-project_cl-string-match}";
      patches = [];
      lisp_dependencies = "${lisp_ascii-strings} ${lisp_cl-string-match} ${lisp_lisp-unit} ${lisp_simple-scanf}";
      name = "lisp_cl-string-match-test-20160421-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
