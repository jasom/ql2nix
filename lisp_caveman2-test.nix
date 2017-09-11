
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman, 
   lisp_prove-asdf, lisp_caveman2, lisp_usocket, lisp_dexador,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_caveman2 lisp_usocket lisp_dexador  ];
      inherit stdenv;
      systemName = "caveman2-test";
      
      sourceProject = "${lisp-project_caveman}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_caveman2} ${lisp_usocket} ${lisp_dexador}";
      name = "lisp_caveman2-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
