
{ buildLispPackage, stdenv, fetchurl, lisp-project_symbol-munger, 
   lisp_alexandria, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_iterate  ];
      inherit stdenv;
      systemName = "symbol-munger";
      
      sourceProject = "${lisp-project_symbol-munger}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_iterate}";
      name = "lisp_symbol-munger-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }