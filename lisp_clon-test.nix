
{ buildLispPackage, stdenv, fetchurl, lisp-project_clon, 
   lisp_clon,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clon  ];
      inherit stdenv;
      systemName = "clon-test";
      
      sourceProject = "${lisp-project_clon}";
      patches = [];
      lisp_dependencies = "${lisp_clon}";
      name = "lisp_clon-test-20110320-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
