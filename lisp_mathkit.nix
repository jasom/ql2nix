
{ buildLispPackage, stdenv, fetchurl, lisp-project_mathkit, 
   lisp_alexandria, lisp_sb-cga,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_sb-cga  ];
      inherit stdenv;
      systemName = "mathkit";
      
      sourceProject = "${lisp-project_mathkit}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_sb-cga}";
      name = "lisp_mathkit-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
