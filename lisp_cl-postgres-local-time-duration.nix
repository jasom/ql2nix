
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-time-duration, 
   lisp_esrap, lisp_local-time, lisp_cl-postgres,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_local-time lisp_cl-postgres  ];
      inherit stdenv;
      systemName = "cl-postgres+local-time-duration";
      
      sourceProject = "${lisp-project_local-time-duration}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_local-time} ${lisp_cl-postgres}";
      name = "lisp_cl-postgres-local-time-duration-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
