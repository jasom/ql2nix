
{ buildLispPackage, stdenv, fetchurl, lisp-project_purl, 
   lisp_percent-encoding, lisp_maxpc,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_percent-encoding lisp_maxpc  ];
      inherit stdenv;
      systemName = "purl";
      
      sourceProject = "${lisp-project_purl}";
      patches = [];
      lisp_dependencies = "${lisp_percent-encoding} ${lisp_maxpc}";
      name = "lisp_purl-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
