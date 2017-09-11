
{ buildLispPackage, stdenv, fetchurl, lisp-project_scriba, 
   lisp_fiveam, lisp_scriba,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_scriba  ];
      inherit stdenv;
      systemName = "scriba-test";
      
      sourceProject = "${lisp-project_scriba}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_scriba}";
      name = "lisp_scriba-test-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
