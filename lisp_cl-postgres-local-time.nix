
{ buildLispPackage, stdenv, fetchurl, lisp-project_local-time, 
   lisp_cl-fad, lisp_cl-postgres,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_cl-postgres  ];
      inherit stdenv;
      systemName = "cl-postgres+local-time";
      
      sourceProject = "${lisp-project_local-time}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_cl-postgres}";
      name = "lisp_cl-postgres-local-time-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
