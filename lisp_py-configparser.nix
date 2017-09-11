
{ buildLispPackage, stdenv, fetchurl, lisp-project_py-configparser, 
   lisp_parse-number,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number  ];
      inherit stdenv;
      systemName = "py-configparser";
      
      sourceProject = "${lisp-project_py-configparser}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number}";
      name = "lisp_py-configparser-20170725-svn";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
