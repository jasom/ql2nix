
{ buildLispPackage, stdenv, fetchurl, lisp-project_com-clearly-useful-protocols, 
   lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "com.clearly-useful.protocols";
      
      sourceProject = "${lisp-project_com-clearly-useful-protocols}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_com-clearly-useful-protocols-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
