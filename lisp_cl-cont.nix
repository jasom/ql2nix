
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cont, 
   lisp_alexandria, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-cont";
      
      sourceProject = "${lisp-project_cl-cont}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_cl-cont-20110219-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
