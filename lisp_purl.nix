
{ buildLispPackage, stdenv, fetchurl, lisp-project_purl, 
   lisp_maxpc, lisp_percent-encoding,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_maxpc lisp_percent-encoding  ];
      inherit stdenv;
      systemName = "purl";
      
      sourceProject = "${lisp-project_purl}";
      patches = [];
      lisp_dependencies = "${lisp_maxpc} ${lisp_percent-encoding}";
      name = "lisp_purl-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
