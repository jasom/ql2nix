
{ buildLispPackage, stdenv, fetchurl, lisp-project_climon, 
   lisp_pal,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_pal  ];
      inherit stdenv;
      systemName = "climon";
      
      sourceProject = "${lisp-project_climon}";
      patches = [];
      lisp_dependencies = "${lisp_pal}";
      name = "lisp_climon-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
