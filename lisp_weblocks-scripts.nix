
{ buildLispPackage, stdenv, fetchurl, lisp-project_weblocks, 
   lisp_cl-fad, lisp_cl-ppcre,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-ppcre  ];
      inherit stdenv;
      systemName = "weblocks-scripts";
      
      sourceProject = "${lisp-project_weblocks}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-ppcre}";
      name = "lisp_weblocks-scripts-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
