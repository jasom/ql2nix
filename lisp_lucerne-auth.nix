
{ buildLispPackage, stdenv, fetchurl, lisp-project_lucerne, 
   lisp_cl-mustache, lisp_log4cl, lisp_clack-errors, lisp_myway, lisp_clack-v1-compat, lisp_clack, lisp_cl-pass,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mustache lisp_log4cl lisp_clack-errors lisp_myway lisp_clack-v1-compat lisp_clack lisp_cl-pass  ];
      inherit stdenv;
      systemName = "lucerne-auth";
      
      sourceProject = "${lisp-project_lucerne}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mustache} ${lisp_log4cl} ${lisp_clack-errors} ${lisp_myway} ${lisp_clack-v1-compat} ${lisp_clack} ${lisp_cl-pass}";
      name = "lisp_lucerne-auth-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
