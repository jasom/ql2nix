
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ansi-text, 
   lisp_alexandria, lisp_cl-ansi-text, lisp_cl-colors, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ansi-text lisp_cl-colors lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-ansi-text-test";
      
      sourceProject = "${lisp-project_cl-ansi-text}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ansi-text} ${lisp_cl-colors} ${lisp_fiveam}";
      name = "lisp_cl-ansi-text-test-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
