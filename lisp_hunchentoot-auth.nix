
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentoot-auth, 
   lisp_cl-store, lisp_cl-who, lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-store lisp_cl-who lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "hunchentoot-auth";
      
      sourceProject = "${lisp-project_hunchentoot-auth}";
      patches = [];
      lisp_dependencies = "${lisp_cl-store} ${lisp_cl-who} ${lisp_hunchentoot}";
      name = "lisp_hunchentoot-auth-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
