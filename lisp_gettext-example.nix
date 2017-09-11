
{ buildLispPackage, stdenv, fetchurl, lisp-project_gettext, 
   lisp_gettext,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gettext  ];
      inherit stdenv;
      systemName = "gettext-example";
      
      sourceProject = "${lisp-project_gettext}";
      patches = [];
      lisp_dependencies = "${lisp_gettext}";
      name = "lisp_gettext-example-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
