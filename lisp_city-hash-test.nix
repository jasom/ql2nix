
{ buildLispPackage, stdenv, fetchurl, lisp-project_city-hash, 
   lisp_city-hash, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_city-hash lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "city-hash-test";
      
      sourceProject = "${lisp-project_city-hash}";
      patches = [];
      lisp_dependencies = "${lisp_city-hash} ${lisp_hu-dwim-stefil}";
      name = "lisp_city-hash-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
