
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_clack-v1-compat, lisp_arnesi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clack-v1-compat lisp_arnesi  ];
      inherit stdenv;
      systemName = "clack-middleware-auth-basic";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_clack-v1-compat} ${lisp_arnesi}";
      name = "lisp_clack-middleware-auth-basic-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
