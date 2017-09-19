
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ksuid, 
   lisp_ironclad, lisp_babel, lisp_prove-asdf, lisp_prove,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_babel lisp_prove-asdf lisp_prove  ];
      inherit stdenv;
      systemName = "cl-ksuid";
      
      sourceProject = "${lisp-project_cl-ksuid}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_babel} ${lisp_prove-asdf} ${lisp_prove}";
      name = "lisp_cl-ksuid-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
