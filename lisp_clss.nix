
{ buildLispPackage, stdenv, fetchurl, lisp-project_clss, 
   lisp_array-utils, lisp_plump,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-utils lisp_plump  ];
      inherit stdenv;
      systemName = "clss";
      
      sourceProject = "${lisp-project_clss}";
      patches = [];
      lisp_dependencies = "${lisp_array-utils} ${lisp_plump}";
      name = "lisp_clss-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
