
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-time-duration, 
   lisp_cl-postgres, lisp_local-time-duration,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-postgres lisp_local-time-duration  ];
      inherit stdenv;
      systemName = "cl-postgres+local-time-duration";
      
      sourceProject = "${lisp-project_local-time-duration}";
      patches = [];
      lisp_dependencies = "${lisp_cl-postgres} ${lisp_local-time-duration}";
      name = "lisp_cl-postgres-local-time-duration-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
