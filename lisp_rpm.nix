
{ buildLispPackage, stdenv, fetchurl, lisp-project_rpm, 
   lisp_cl-ppcre, lisp_fare-utils, lisp_inferior-shell, lisp_lambda-reader,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_fare-utils lisp_inferior-shell lisp_lambda-reader  ];
      inherit stdenv;
      systemName = "rpm";
      
      sourceProject = "${lisp-project_rpm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_fare-utils} ${lisp_inferior-shell} ${lisp_lambda-reader}";
      name = "lisp_rpm-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
