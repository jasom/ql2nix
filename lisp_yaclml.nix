
{ buildLispPackage, stdenv, fetchurl, lisp-project_yaclml, 
   lisp_arnesi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arnesi  ];
      inherit stdenv;
      systemName = "yaclml";
      
      sourceProject = "${lisp-project_yaclml}";
      patches = [];
      lisp_dependencies = "${lisp_arnesi}";
      name = "lisp_yaclml-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
