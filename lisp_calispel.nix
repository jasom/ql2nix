
{ buildLispPackage, stdenv, fetchurl, lisp-project_calispel, 
   lisp_jpl-queues,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_jpl-queues  ];
      inherit stdenv;
      systemName = "calispel";
      
      sourceProject = "${lisp-project_calispel}";
      patches = [];
      lisp_dependencies = "${lisp_jpl-queues}";
      name = "lisp_calispel-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
