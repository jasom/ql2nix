
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gpio, 
   lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "cl-gpio";
      
      sourceProject = "${lisp-project_cl-gpio}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils}";
      name = "lisp_cl-gpio-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
