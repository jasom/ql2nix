
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-html, 
   lisp_common-html, lisp_fiveam,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-html lisp_fiveam  ];
      inherit stdenv;
      systemName = "common-html-test";
      
      sourceProject = "${lisp-project_common-html}";
      patches = [];
      lisp_dependencies = "${lisp_common-html} ${lisp_fiveam}";
      name = "lisp_common-html-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
