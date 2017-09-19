
{ buildLispPackage, stdenv, fetchurl, lisp-project_rpm, 
   lisp_cl-ppcre, lisp_lambda-reader, lisp_inferior-shell,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_lambda-reader lisp_inferior-shell  ];
      inherit stdenv;
      systemName = "rpm";
      
      sourceProject = "${lisp-project_rpm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_lambda-reader} ${lisp_inferior-shell}";
      name = "lisp_rpm-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
