
{ buildLispPackage, stdenv, fetchurl, lisp-project_sb-cga, 
   lisp_alexandria, lisp_madeira-port,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_madeira-port  ];
      inherit stdenv;
      systemName = "sb-cga";
      
      sourceProject = "${lisp-project_sb-cga}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_madeira-port}";
      name = "lisp_sb-cga-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
