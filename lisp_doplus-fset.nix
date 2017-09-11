
{ buildLispPackage, stdenv, fetchurl, lisp-project_doplus, 
   lisp_doplus, lisp_fset,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_doplus lisp_fset  ];
      inherit stdenv;
      systemName = "doplus-fset";
      
      sourceProject = "${lisp-project_doplus}";
      patches = [];
      lisp_dependencies = "${lisp_doplus} ${lisp_fset}";
      name = "lisp_doplus-fset-20170630-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
