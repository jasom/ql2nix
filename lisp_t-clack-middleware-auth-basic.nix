
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_prove-asdf, lisp_clack, lisp_clack-test, lisp_clack-v1-compat, lisp_clack-middleware-auth-basic, lisp_drakma,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_clack lisp_clack-test lisp_clack-v1-compat lisp_clack-middleware-auth-basic lisp_drakma  ];
      inherit stdenv;
      systemName = "t-clack-middleware-auth-basic";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_clack} ${lisp_clack-test} ${lisp_clack-v1-compat} ${lisp_clack-middleware-auth-basic} ${lisp_drakma}";
      name = "lisp_t-clack-middleware-auth-basic-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
