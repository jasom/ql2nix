
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_clack-v1-compat, lisp_cl-oauth,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-v1-compat lisp_cl-oauth  ];
      inherit stdenv;
      systemName = "clack-middleware-oauth";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_clack-v1-compat} ${lisp_cl-oauth}";
      name = "lisp_clack-middleware-oauth-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
