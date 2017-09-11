
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-time, 
   lisp_cl-postgres, lisp_local-time,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-postgres lisp_local-time  ];
      inherit stdenv;
      systemName = "cl-postgres+local-time";
      
      sourceProject = "${lisp-project_local-time}";
      patches = [];
      lisp_dependencies = "${lisp_cl-postgres} ${lisp_local-time}";
      name = "lisp_cl-postgres-local-time-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
