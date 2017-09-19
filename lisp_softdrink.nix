
{ buildLispPackage, stdenv, fetchurl, lisp-project_softdrink, 
   lisp_lass, lisp_lquery,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lass lisp_lquery  ];
      inherit stdenv;
      systemName = "softdrink";
      
      sourceProject = "${lisp-project_softdrink}";
      patches = [];
      lisp_dependencies = "${lisp_lass} ${lisp_lquery}";
      name = "lisp_softdrink-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
