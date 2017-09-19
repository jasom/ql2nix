
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-moss, 
   lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-moss";
      
      sourceProject = "${lisp-project_cl-moss}";
      patches = [];
      lisp_dependencies = "${lisp_usocket}";
      name = "lisp_cl-moss-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
