
{ buildLispPackage, stdenv, fetchurl, lisp-project_rfc3339-timestamp, 
   lisp_yacc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_yacc  ];
      inherit stdenv;
      systemName = "rfc3339-timestamp";
      
      sourceProject = "${lisp-project_rfc3339-timestamp}";
      patches = [];
      lisp_dependencies = "${lisp_yacc}";
      name = "lisp_rfc3339-timestamp-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
