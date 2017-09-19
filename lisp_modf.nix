
{ buildLispPackage, stdenv, fetchurl, lisp-project_modf, 
   lisp_iterate, lisp_closer-mop, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "modf";
      
      sourceProject = "${lisp-project_modf}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_modf-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
