
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gists, 
   lisp_prove-asdf, lisp_cl-gists, lisp_prove, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_cl-gists lisp_prove lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-gists-test";
      
      sourceProject = "${lisp-project_cl-gists}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_cl-gists} ${lisp_prove} ${lisp_closer-mop}";
      name = "lisp_cl-gists-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
