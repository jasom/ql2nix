
{ buildLispPackage, stdenv, fetchurl, lisp-project_clod, 
   lisp_cl-ppcre, lisp_closer-mop, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_closer-mop lisp_iterate  ];
      inherit stdenv;
      systemName = "clod";
      
      sourceProject = "${lisp-project_clod}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_iterate}";
      name = "lisp_clod-20141217-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
