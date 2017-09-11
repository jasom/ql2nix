
{ buildLispPackage, stdenv, fetchurl, lisp-project_jonathan, 
   lisp_prove-asdf, lisp_jonathan, lisp_prove, lisp_legion,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_jonathan lisp_prove lisp_legion  ];
      inherit stdenv;
      systemName = "jonathan-test";
      
      sourceProject = "${lisp-project_jonathan}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_jonathan} ${lisp_prove} ${lisp_legion}";
      name = "lisp_jonathan-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
