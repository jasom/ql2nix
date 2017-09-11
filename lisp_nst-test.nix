
{ buildLispPackage, stdenv, fetchurl, lisp-project_nst, 
   lisp_asdf-nst, lisp_nst, lisp_nst-meta-tests, lisp_nst-simple-tests,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-nst lisp_nst lisp_nst-meta-tests lisp_nst-simple-tests  ];
      inherit stdenv;
      systemName = "nst-test";
      
      sourceProject = "${lisp-project_nst}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-nst} ${lisp_nst} ${lisp_nst-meta-tests} ${lisp_nst-simple-tests}";
      name = "lisp_nst-test-4.1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
