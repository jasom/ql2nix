
{ buildLispPackage, stdenv, fetchurl, lisp-project_talcl, 
   lisp_buildnode,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_buildnode  ];
      inherit stdenv;
      systemName = "talcl";
      
      sourceProject = "${lisp-project_talcl}";
      patches = [];
      lisp_dependencies = "${lisp_buildnode}";
      name = "lisp_talcl-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
